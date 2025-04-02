# Vectra Detect Google SecOps Integration

## Pre-Requisites
- Vectra Platform
- Google SecOps

## Vectra Google SecOps Forwarder
1. Setup Google Security Operations Forwarder.
    - Users must first install and configure the Google Security Operations forwarder for Vectra Detect log type in their environment. Refer to the below guides for detailed setup instructions.
        - [Forwarder Configuration from UI.](https://cloud.google.com/chronicle/docs/install/forwarder-management-configurations)
        - [Install and Configure the Forwarder.](https://cloud.google.com/chronicle/docs/install/install-forwarder)
2. Configure Vectra for Syslog Forwarding
    - Once the Google SecOps Syslog forwarder is configured, Vectra Administrator users can enable Vectra to send the host and Account scoring information, detection details, and audit logs over syslog to external collectors for further storage and analysis.

Refer to the [Vectra Syslog Guide](https://support.vectra.ai/s/article/KB-VS-1233) for step-by-step configuration details.

## Parser Deployment

> **Important:** : This parser deployment process is not required, once we successfully submit the parser repo.

1. In the navigation bar, select Setting > SIEM Settings > Parsers.
2. Search the Parsers table for the log type you want to extend.
3. Click Create Parser.
4. Select Vectra Detect log source from the Log Source list.
5. Select Start with Raw Logs Only to create a new parser.
6. Copy the parser content from github repo and paste it in the code section.
7. Click Validate to validate the custom parser, the validation process may take a few minutes.
8. Click Submit.
9. After successful validation, click on Next
The parser is picked for normalization after 20 minutes.

## View Events in Google SecOps

1. Log in to Google SecOps:
    - Open a web browser and navigate to the Google SecOps instance URL. For example: https://test.backstory.chronicle.security/
    - Replace test with your actual Google SecOps instance name.
2. Access SIEM Search:
    - From the top left corner of the Google SecOps console, select the "Investigation" option.
    - Within the Investigation section, choose "SIEM Search".
3. Filter Events by Log Type:
    - In the SIEM Search interface, locate the "UDM Search" section.
    - Apply a filter for the metadata field "log_type". Set the filter value to metadata.log_type="VECTRA_DETECT".
4. View Vectra Events:
    - The SIEM Search results will display Vectra events within the "Events" section.
