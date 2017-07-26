Bam Links
=========

Create a new Bam Link
---------------------

Request
^^^^^^^

::

    POST /api/v1/autobam/bam_links/

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - url
     - string
     - The URL of the product page for this Bam Link.

   * - edit_name
     - string
     - The name of the edit or article that this Bam Link will be featured on.

   * - edit_url
     - string
     - Optional. The URL of the edit or article that this Bam Link will be featured on.

   * - channel
     - string
     - Optional. The name of the advertising channel, used for grouping data in reports.

   * - exclusive_match_requested
     - boolean
     - Optional. If true, lock this Bam Link to the original merchant. Default false.

Response
^^^^^^^^

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - bam_link.bam_link_id
     - integer
     - A unique identifier for the Bam Link that was created.

   * - bam_link.bam_link_url
     - string
     - The URL of the Bam Link, which should be substituted for the original link in your article.

Example
^^^^^^^

::

    curl -i -H 'Authorization: BAMX-API-KEY Sy8xLzE2MTE3MDIxNzY3NDM0OTc0MDcv' \
        -H 'Content-Type: application/json' \
        -d '{"url": "https://www.google.com/",
             "edit_name": "Top Ten Search Engines",
             "edit_url": "http://www.my-blog.example",
             "channel": "Newsletter",
             "exclusive_match_requested": true}' \
        https://api.bam-x.com/api/v1/autobam/bam_links/

::

    HTTP/1.1 201 CREATED
    Content-Type: application/json

    {
      "info": {
        "error": false,
        "status": 201,
      },
      "data": [
        {
          "edit": {
            "edit_id": 2536,
            "uid": 2,
            "pub_id": 1,
            "url": "http://www.my-blog.example",
            "datetime_created": "2017-07-26T19:48:25Z",
            "datetime_updated": "2017-07-26T19:48:25Z",
            "name": "Top Ten Search Engines"
          },
          "bam_link": {
            "bam_link_id": 2554,
            "auction_id": 1611792246540568252,
            "uid_created": 2,
            "datetime_created": "2017-07-26T19:48:25Z",
            "pub_id": 1,
            "url": "https://www.google.com/",
            "edit_id": 2536,
            "channel": "Newsletter",
            "exclusive_match_requested": true,
            "bam_link_url": "http://shop-links.co/1611792246540568252"
          }
        }
      ]
    }
