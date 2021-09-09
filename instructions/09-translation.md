---
lab:
    title: 'Translation'
    module: 'Module 3: Explore Natural Language Processing'
---

# Translation

TOne of the driving forces that has enabled human civilization to develop is the ability to communicate with one another. In most human endeavors, communication is key. Artificial Intelligence (AI) can help simplify communication by translating text or speech between languages, helping to remove barriers to communication across countries and cultures. 

For example, suppose you want to create a smart device that can respond verbally to spoken questions, such as "What time is it?"

## Create a Cognitive Services resource 

In Azure, you can use the cognitive services to translate between multiple languages.

If you don't already have one, use the following steps to create a **Cognitive Services** resource in your Azure subscription:

> **Note**: If you already have a Cognitive Services resource, just open its **Quick start** page in the Azure portal and copy its key and endpoint to the cell below. Otherwise, follow the steps below to create one.

1. In another browser tab, open the Azure portal at https://portal.azure.com, signing in with your Microsoft account.
2. Click the **&#65291;Create a resource** button, search for *Cognitive Services*, and create a **Cognitive Services** resource with the following settings:
    - **Subscription**: *Your Azure subscription*.
    - **Resource group**: *Select or create a resource group with a unique name*.
    - **Region**: *Choose any available region*:
    - **Name**: *Enter a unique name*.
    - **Pricing tier**: S0
    - **I confirm I have read and understood the notices**: Selected.

### Get the Key and Location for your Cognitive Services resource

To use your cognitive services resource, client applications need its authentication key and location:

1. Wait for deployment to complete. Then go to your cognitive services resource, and on the **Overview** page, click the link to manage the keys for the service. You will need the endpoint and keys to connect to your cognitive services resource from client applications.
2. View the **Keys and Endpoint** page for your Speech resource. You will need the location/region and keys to connect from client applications.

