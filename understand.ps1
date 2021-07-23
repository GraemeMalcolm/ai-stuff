
$appId="YOUR_APP_ID"
$endpointUrl="YOUR_ENDPOINT_URL"
$key = "YOUR_PRIMARY_KEY"



# Code to call Language Understanding service for intent prediction
if ($args.count -gt 0){
    $utterance = $args[0].ToString()
    $url = "$($endpointUrl)/luis/prediction/v3.0/apps/$($appId)/slots/production/predict?subscription-key=$($key)&query=$($utterance)"
    $result = Invoke-RestMethod -Method Get -Uri $url
    $predictedIntent = $result.prediction.topIntent
    $predictedDevice = $result.prediction.entities.device
    if($predictedDevice -in ("light","fan")){
        if($predictedIntent -eq "switch_on"){
            Write-Host "$predictedDevice on" -BackgroundColor Yellow -ForegroundColor Black
        }
        else {
            Write-Host "$predictedDevice off" -BackgroundColor Gray -ForegroundColor White
        }
    }
    else{
        Write-Host("Sorry, I don't understand.")
        Write-Host("Predicted intent: $predictedIntent")
        Write-Host("Predicted device: $predictedDevice")
    }
}
else {
    Write-Host("Sorry, I don't understand.")
}
Write-Host "`n"




