--  Create datum & redeemer 

newtype MyDatum :: MyDatum Integer deriving newtype PlutusTx.IsData
PlutusTx.makeLift ''MyDatum -- compile code to plutus core

newtype MyRedeemer :: MyRedeemer Integer deriving newtype PlutusTx.IsData
PlutusTx.makeLift ''MyRedeemer

-- Create a validator to know if the redeemer are the right person that they say they are
-- Verify if my Redeemer is the same as my Datum
mkValidator :: MyDatum -> MyRedeemer -> ValidatorCtx -> Bool
mkValidator (MyDatum _myDataValue) (MyRedeemer _myRedeemerValue) _ = myDataValue == myRedeemerValue

-- get address
contractAddress :: Address
contractAddress = Ledger.scriptAddress(Scripts.validatorScript starterInstance)

--  typage 
data Starter
instance Scripts.Scripts.ScriptsType Starter where
    type instance RedeemerType Starter = MyRedeemer
    type instance DatumType Starter = MyDatum

-- Script instance is the compiled validator ready to go on chain
starterInstance :: Scripts.ScriptInstance Starter
starterInstance = Scripts.validator @Starter
    $$(PlutusTx.compile [|| mkValidator ||])
    $$(PlutusTx.compile [|| wrap ||]) where
        wrap = Scripts.wrapValidator @MyDatum @MyRedeemer

-- Schema of contract with two endpoints
type Schema = 
    BlockchainActions 
        .\/ Endpoint "publish" (Integer, Value)
        .\/ Endpoint "redeem" Integer

-- Base of what the user input we will call the publish function or the redeem function
-- Return a contract function with a schema
contract :: AsContractError e => Contract Schema e ()
contract = publish `select` redeem

-- Publishb contract endpoint
publish :: AsContractError e => Contract Schema e ()
publish = do
    (i,lockedFunds) <- endpoint @"publish"
    let tx = Constraints.mustPayToTheScript (MyDatum i) lockcedFunds
    void $ submitTxConstraints starterInstance tx

-- The redeem contract endpoint
redeem :: AsContractError e => Contract Schema e ()
redeem = do
    MyRedeemValue <- endpoint @"redeem"
    unspentOutputs <- utxoAt contractAddress
    let redeemer = MyRedeemer myRedeemerValue
        tx       = collectFromScript unspentOutputs redeemer
    void $ submitTxConstraintsSpending starterInstance unspentOutputs tx

endpoints :: AsContractError e => Contract Schema e ()
endpoints = contract

mkSchemaDefinitions '' Schema

$(mkKnownCurrencies [])   




    

