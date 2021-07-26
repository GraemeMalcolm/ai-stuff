---
lab:
    title: 'Build a QnA Bot'
    module: 'Module 4: Conversational AI'
---

# Build a QnA Bot

For customer support scenarios, it's common to create a bot that can interpret and answer frequently asked questions through a website chat window, email, or voice interface. Underlying the bot interface is a knowledge base of questions and appropriate answers that the bot can search for suitable responses.

The QnA Maker service is a cognitive service in Azure that enables you to quickly create a knowledge base, either by entering question and answer pairs or from an existing document or web page. It can then use some built-in natural language processing capabilities to interpret questions and find appropriate answers.

1. Open the QnA Maker portal at https://qnamaker.ai. Sign in using the Microsoft account associated with your Azure subscription.
2. In the QnA Maker portal, select **Create a knowledge base**.
3. If you haven't previously created a QnA service resource, select **Create a QnA service**. The Azure portal will be opened in another tab so you can create a QnA Maker service in your subscription. Use the following settings:
    - **Subscription**: *Your Azure subscription*
    - **Resource group**: *Select an existing resource group or create a new one*
    - **Name**: *A unique name for your QnA resource*
    - **Pricing tier**: Free F0
    - **Azure Search location**: *Any available location*
    - **Azure Search pricing tier**: Free F
    - **App name**: _Same as **Name** (".azurewebsites.net" will be appended automatically)_
    - **Website location**: _Same as **Azure Search location**_
    - **App insights**: Disable

> **Note**: If you have already provisioned a free-tier **QnA Maker** or **Azure Search** resources, your quota may not allow you to create another one. In which case, select a tier other than **F0** / **F**.

4. Wait for the deployment of the QnA Service and related resources to complete in the Azure portal.
5. Return to the QnA Maker portal tab, and in the **Step 2** section, click **Refresh** to refresh the list of available QnA service resources.
6. Connect your QnA service to your KB by selecting the following options:
  - **Microsoft Azure Directory ID**: *The Azure directory ID for your subscription*
  - **Azure subscription name**: *Your Azure subscription*
  - **Azure QnA service**: *The QnA service resource you created in the previous step*
  - **Language**: English

    > **Tip**:
    If a message stating that the role does not have permission to perform the action is displayed, refresh the browser page for the QnA Maker portal.

7. In the **Step 3** section, enter the name **Margie's Travel KB**.
8. In the **Step 4** section, in the **URL** box, type *https://github.com/GraemeMalcolm/ai-stuff/raw/main/data/qna/margies_faq.docx* and click **+ Add URL**. Then under **Chit-chat**, select **Professional**.
9. In the **Step 5** section, click **Create your KB**.
10. Wait for a minute or so while your Knowledge base is created. Then review the questions and answers that have been imported from the FAQ document and the professional chit-chat pre-defined responses.