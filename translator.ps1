$endpoint="YOUR_ENDPOINT"
$key="YOUR_KEY"
$location="LOCATION"

$text="Hello what is your name"
# Code to call Text Analytics service to analyze sentiment in text

$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Ocp-Apim-Subscription-Region", $location )
$headers.Add( "Content-Type","application/json" )

$body = "[{'text': '$text'}]" 

write-host "Translating text..."
$result = Invoke-Webrequest -Method Post `
          -Uri "$endpoint/translate?api-version=3.0&from=en&to=fr" `
          -Headers $headers `
          -Body $body 

$analysis = $result.content | ConvertFrom-Json
$test = $analysis.translations.text 
Write-Host("`nOriginal Text: $text`nTranslated Text: $($test)")














