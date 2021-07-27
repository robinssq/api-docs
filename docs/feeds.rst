Product Feeds
=============

Ingesting Product Feeds
-----------------------

In order for Narrativ to accurately match publisher recommendation links to a merchant's product, we require a
comprehensive product feed. Depending on your preference, we can either fetch your feed or you can send it to us via
HTTP, FTP or SFTP using the specifications detailed below. Feeds sent via FTP or SFTP should be scheduled for daily
export.

Narrativ recommends following Google's Product Data Specification for all new merchants to ensure a successful integration
occurs in a timely manner. Google's Product Data Specification can be found [here](https://support.google.com/merchants/answer/7052112?hl=en). 

Formatting
----------

We currently support CSV and XML file formats and zip and gzip compressed files. Please ensure the fields GTIN
(or SKU if unavailable), Product URL and Stock Status are included in the file. You can view a `sample file`_ here.

Send via FTP
------------
Note: Enable passive and binary modes

.. list-table::
   :widths: 20 70
   :header-rows: 1

   * - Field Name
     - Value

   * - Host
     - feeds.bam-x.com

   * - Static IP
     - 52.7.95.122

   * - Port
     - 2221

   * - Username
     - Will be provided to you

   * - Password
     - Will be provided to you

   * - Filename
     - USERNAME-USD-yyyy-mm-dd.csv.zip


Send via SFTP
-------------
Please generate and provide us with a public RSA key to register as an authorized key for your users.

.. list-table::
   :widths: 20 70
   :header-rows: 1

   * - Field Name
     - Value

   * - Host
     - feeds.bam-x.com

   * - Static IP
     - 52.7.95.122

   * - Port
     - 2223

   * - Username
     - Will be provided to you

   * - Filename
     - USERNAME-USD-yyyy-mm-dd.csv.zip

If you have any questions about product feed requirements, please feel free to reach out to solutions@narrativ.com
for assistance.

.. _sample file: https://docs.google.com/spreadsheets/d/1VQLhQ_9xVtjO8ipXnUTsjnumJ1HaErYsXPheNErWo8k/edit#gid=0
