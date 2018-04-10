SmartLinks
==========

Create a new SmartLink
----------------------

Request
^^^^^^^

::

    POST /api/v1/smart_links/

.. NOTE: Don't explicitly say that `article_url` or `article_publication_date`
   are optional -- we want clients to fill in these fields.

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - url
     - string
     - The URL of the product page for this SmartLink.

   * - article_name
     - string
     - The name of the article that this SmartLink will be featured on.

   * - article_url
     - string
     - The URL of the article that this SmartLink will be featured on.

   * - article_publication_date
     - timestamp
     - The date/time when the article is expected to be published.

   * - channel
     - string
     - Optional. The name of the :ref:`advertising channel <channels>`, used for grouping data in reports.

   * - exclusive_match_requested
     - boolean
     - Optional. If true, lock this SmartLink to the original merchant. Default false.


.. _channels:

.. list-table::
   :header-rows: 1

   * - Channel Name

   * - Site

   * - Newsletter

   * - Facebook

   * - Instagram

   * - Twitter

   * - YouTube

   * - Other


Response
^^^^^^^^

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - auction_id
     - string
     - A long unique identifier for the SmartLink that was created.

   * - smart_link_id
     - integer
     - A unique identifier for the SmartLink that was created.

   * - smart_link_url
     - string
     - The URL of the SmartLink, which should be substituted for the original link in your article.

Example
^^^^^^^

::

    curl -i -H 'Authorization: NRTV-API-KEY Sy8xLzE2MTE3MDIxNzY3NDM0OTc0MDcv' \
        -H 'Content-Type: application/json' \
        -d '{"url": "https://www.google.com/",
             "article_name": "Top Ten Search Engines",
             "article_url": "http://www.my-blog.example",
             "article_publication_date": "2017-08-02T17:00:00Z",
             "channel": "Newsletter",
             "exclusive_match_requested": true}' \
        https://api.narrativ.com/api/v1/smart_links/

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
          "smart_link_id": 2554,
          "auction_id": "1611792246540568252",
          "uid_created": 2,
          "datetime_created": "2017-07-26T19:48:25Z",
          "pub_id": 1,
          "url": "https://www.google.com/",
          "channel": "Newsletter",
          "exclusive_match_requested": true,
          "smart_link_url": "https://shop-links.co/1611792246540568252",
          "article": {
            "article_id": 2536,
            "uid": 2,
            "pub_id": 1,
            "url": "http://www.my-blog.example",
            "publication_date": "2017-08-02T17:00:00Z",
            "datetime_created": "2017-07-26T19:48:25Z",
            "datetime_updated": "2017-07-26T19:48:25Z",
            "name": "Top Ten Search Engines"
          }
        }
      ]
    }
