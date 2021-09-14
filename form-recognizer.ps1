$endpoint="YOUR_ENDPOINT"
$key="YOUR_KEY"

# For this unit, there is only one sample receipt image
$img_file = "receipt.jpg"

# Create the URL where the raw receipt image can be found
$img = "https://raw.githubusercontent.com/GraemeMalcolm/ai-stuff/main/data/vision/$img_file"

Write-Host $img

# Create the header for the REST POST with the subscription key
# In this example, the URL of the image will be sent instead of 
# the raw image, so the Content-Type is JSON
$headers = @{}
$headers.Add( "Ocp-Apim-Subscription-Key", $key )
$headers.Add( "Content-Type","application/json" )

# Create the body with the URL of the raw image
$body = "{ 'source': '$img' }"

# Call the receipt analyze method with the header and body
Write-Host "Analyzing receipt..."
$result = Invoke-RestMethod -Method Post `
          -Uri "$endpoint/formrecognizer/v2.1/prebuilt/receipt/analyze?includeTextDetails=true&locale=en-US" `
          -Headers $headers `
          -Body $body | ConvertTo-Json -Depth 10
Write-Host "...Done`n"

# Extract the resultID from the response of the receipt anaylzer
# TODO
$resultID = 0

# Create the header for the REST POST with the subscription key
$resultHeaders = @{}
$resultHeaders.Add( "Ocp-Apim-Subscription-Key", $key )

# Get the receipt analysis results, passing in the resultID
Write-Host "Getting results..."
$result = Invoke-RestMethod -Method Get `
          -Uri "$endpoint/formrecognizer/v2.1/prebuilt/receipt/analyzeResults/$resultID" `
          -Headers $resultHeaders | ConvertTo-Json -Depth 10
Write-Host "...Done`n"

# Get the object of the receipt analysis results
$analysis = ($result | ConvertFrom-Json)

# Print out all of the properties of the receipt analysis
# TODO