$predictionUrl="YOUR_PREDICTION_URL"
$predictionKey = "YOUR_PREDITION_KEY"



# Code to call Custom Vision service for image detection

$img = "https://github.com/GraemeMalcolm/ai-stuff/raw/main/data/vision/produce.jpg"

$headers = @{}
$headers.Add( "Prediction-Key", $predictionKey )
$headers.Add( "Content-Type","application/json" )

$body = "{'url' : '$img'}"

write-host "Analyzing image..."
$result = Invoke-RestMethod -Method Post `
          -Uri $predictionUrl `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 5

$prediction = $result | ConvertFrom-Json

Write-Host ("`n",$prediction.predictions[0].tagName, "`n")