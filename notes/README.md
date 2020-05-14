Collection of programming notes

## Web gateway  


### Terminal ID  

All HTTP requests to gateway endpoints should contain a $_GET query parameter called terminal_id. For example:  
- http://wg.smartpay/vignette-issue.php?terminal_id=789
- http://wg.smartpay/vignette-download.php?id=21286001&terminal_id=789


### Common headers  

Post requests should contains the following common headers for JSON requests:  
- "Content-Type: application/json"
- "Accept: application/json"


### Availability information  
HTTP Verb: GET  
Location: '/availability.php?id=3'  
Response  
```json
{
    "Id": 3,
    "TimeUnits": 1,
    "TimeUnitType": "Zi",
    "Description": "1 zi",
    "IsChassisNumberRequired": false,
    "IsActive": true
}
```

### Car plate codification rules  
HTTP Verb: GET  
Location: '/plate.php'  
Response  
```json
[
    {
        "Id": 1,
        "Regex": "((AB|AG|AR|BC|BH|BN|BR|BT|BV|BZ|CJ|CL|CS|CT|CV|DB|DJ|GJ|GL|GR|HD|HR|IF|IL|IS|MH|MM|MS|NT|OT|PH|SB|SJ|SM|SV|TL|TM|TR|VL|VN|VS){1}([0]{1}[1-9]{1}|[1-9]{1}\\d{1})([A-PR-Z]){3})|((B){1}([0]{1}[1-9]{1}|[1-9]{1}\\d{1,2})([A-PR-Z]){3})|((AB|AG|AR|B|BC|BH|BN|BR|BT|BV|BZ|CJ|CL|CS|CT|CV|DB|DJ|GJ|GL|GR|HD|HR|IF|IL|IS|MH|MM|MS|NT|OT|PH|SB|SJ|SM|SV|TL|TM|TR|VL|VN|VS|CD|CO|TC){1}[1-9]{1}\\d{2,10})",
        "Country": "RO",
        "IsActive": true
    }
]
```

### Vehicle information  
HTTP Verb: GET  
Location: '/vehicle?id=3'  
Response  
```json
{
    "Id": 3,
    "VehicleType": "A",
    "ShortDescription": "A - Autoturisme",
    "Description": "Autoturisme",
    "IsActive": true
}
```


### City information  
HTTP Verb: GET  
Location: '/city.php?id=127660'  
Response  
```json
{
    "Id": "127660",
    "Name": "Valea Ramnicului",
    "CountyCode": "BZ",
    "IsActive": true
}
```


### Country information  
HTTP Verb: GET  
Location: '/country.php?id=RO'  
Response  
```json
{
    "Id": "RO",
    "Name": "ROMANIA",
    "IsActive": true
}
```


### County information  
HTTP Verb: GET  
Location: '/county.php?id=AB'  
Response  
```json
{
    "Id": "AB",
    "Name": "Alba",
    "IsActive": true
}
```

### Currency information  
HTTP Verb: GET  
Location: '/currency.php?id=EUR'  
Response  
```json
{
    "Id": "EUR",
    "Description": "Euro",
    "IsActive": true
}
```


### Exchange rate  
HTTP Verb: GET  
Location: '/exchange-rate.php?id=10026669'    
Response  
```json
{
    "Id": 10026669,
    "Value": 4.3197,
    "HistDate": "2012-01-03T00:00:00",
    "Currency": "EUR",
    "RefCurrency": "RON"
}
```


'/payment-method.php?id=3' .................... // PAYMENT METHOD
### Vehicle information  
HTTP Verb: GET  
Location: '/vehicle?id=3'  
Response  
```json
...
```


'/price.php?currency=EUR&refCurrency=RON' ..... // PRICES
### Vehicle information  
HTTP Verb: GET  
Location: '/vehicle?id=3'  
Response  
```json
...
```


'/vignette/issue.php' ......................... // DOWNLOAD VIGNETTE
### Vehicle information  
HTTP Verb: GET  
Location: '/vehicle?id=3'  
Response  
```json
...
```
// REQUEST
// {
//     "RegistrationNumber":"SM09ABP",
//     "ChassisNumber":"WAUZZZ8X8EB095418",
//     "Country":"RO",
//     "VehicleId":1,
//     "AvailabilityId":2,
//     "StartDate":"2019-10-21T00:00:00",
//     "Currency":"EUR",
//     "RefCurrency":"RON",
//     "CurrencyAmount":3,
//     "RefCurrencyAmount":14.25,
//     "ExchangeRateDate":"2019-09-30T00:00:00",
//     "PaymentMethod":1,
//     "GenerateDocument":true,
//     "CustomerNumber":"0205869"
// }

// RESPONSE (success)
// {
//     "VignetteId": "2128600939",
//     "TransactionId": "CNADNR0082488207",
//     "RegistrationNumber": "SM09ABP",
//     "ChassisNumber": "WAUZZZ8X8EB095418",
//     "Country": "RO",
//     "StartDate": "2019-10-21T11:17:42.381+03:00",
//     "EndDate": "2019-10-27T23:59:59.999+02:00",
//     "Success": true
// }


'/vignette/download.php?id=21059003' .......... // DOWNLOAD VIGNETTE
### Vehicle information  
HTTP Verb: GET  
Location: '/vehicle?id=3'  
Response  
```json
...
```
