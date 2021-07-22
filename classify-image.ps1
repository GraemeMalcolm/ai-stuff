$predictionUrl="https://gmalc-cog.cognitiveservices.azure.com/customvision/v3.0/Prediction/472aef85-c536-4b3c-a34e-c41d7f51d584/classify/iterations/fruit/url"
$predictionKey = "9fc9db061ed04f448cc31a01050bd976"



# Code to call Custom Vision service for image classification

$img_num = 1
if ($args.count -gt 0 -And $args[0] -in (1..3))
{
    $img_num = $args[0]
}

$img = "https://github.com/GraemeMalcolm/ai-stuff/raw/main/data/vision/fruit-$($img_num).jpg"

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