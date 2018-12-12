Product Feeds
==========================

Ingesting Product Feeds
------------

We can set up a call with engineering teams to set up a preferred method of delivering us your product feed.
We can either fetch your feed or you can send it to us via HTTP, FTP or SFTP using the specifications detailed below.
We currently support CSV and XML file formats and zip and gzip compressed files. If you have any questions,
please feel free to reach out to hello@narrativ.com for assistance.

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
------------
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

   * - Private Key
     - Created with public key

   * - Filename
     - USERNAME-USD-yyyy-mm-dd.csv.zip
