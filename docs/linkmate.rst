LinkMate
========

Usage
-----

Use the LinkMate API to retrieve the SmartLinks for a set of URLs,
automatically creating new SmartLinks that do not already exist.
LinkMate eliminates the need to create SmartLinks up front via the Chrome
Extension, making it easier for large publications to get started on the
Narrativ platform.

Your account must be a member of our LinkMate program to use this feature.
For more information about this program, feel free to `contact us`_.

.. note:: The LinkMate API does not require client authentication, but may be
   subject to rate-limiting if called an extreme number of times from the
   same origin. If you are developing a server application, consider using
   the :doc:`SmartLinks API <smartlink>` instead.


Create and Retrieve Links
-------------------------

Request
^^^^^^^

::

    POST /api/v1/publishers/<pub_id>/linkmate/smart_links/

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - URL Path Parameter
     - Type
     - Description

   * - pub_id
     - integer
     - Your publisher ID.


Request payload
"""""""""""""""

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - article
     - object
     - Information about the page/article which contains your links.

   * - links
     - list[object]
     - Data for each link you are submitting.


Article information
"""""""""""""""""""

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - name
     - string(255)
     - The name of the page/article which contains your links.

   * - url
     - string(2048)
     - The URL of the page/article which contains your links.


Links
"""""

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - raw_url
     - string
     - The URL being submitted for SmartLink creation/retrieval.

   * - exclusive_match_requested
     - boolean
     - Optional. If true, lock this SmartLink to the original merchant.
       Default false.


Response
^^^^^^^^

For each original URL you submit, the following actions occur:

* If the URL has never been submitted before with the specified article,
  a new SmartLink is created for the URL and assigned to the article.

* If the URL-article combination has already been submitted before,
  the existing SmartLink is retrieved.

* If a SmartLink is not yet available for the URL, or the URL is not
  valid for SmartLink creation, nothing happens. (It is still possible
  for SmartLink data to become available on subsequent API calls, since
  link creation takes place asynchronously.)

The response data consists of the list ``smart_links``, with each entry
having the following structure:

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - auction_id
     - string
     - A long unique identifier for the SmartLink that was created, for use
       with the Auction API.

   * - smart_link_id
     - integer
     - A unique identifier for the SmartLink that was created.

   * - url
     - string
     - The original URL that was submitted for SmartLink creation.


Example
^^^^^^^

Submitting a collection of three URLs::

    POST /api/v1/publishers/2143/linkmate/smart_links/

    {
      "article": {
        "name": "Top Search Engines",
        "url": "https://my-blog.com.example/top-search-engines.html"
      },
      "links": [
        {
          "raw_url": "https://www.google.com/",
          "exclusive_match_requested": true
        },
        {
          "raw_url": "https://www.bing.com/",
          "exclusive_match_requested": true
        },
        {
          "raw_url": "https://www.yahoo.com/",
          "exclusive_match_requested": true
        }
      ]
    }

If SmartLinks are available for the first two URLs, but not the last one,
the response might look like the following::

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "info": {
        "error": false,
        "status": 200
      },
      "data": [
        {
          "smart_links": [
            {
              "smart_link_id": 211925,
              "auction_id": "1629787850745092913",
              "uid_created": null,
              "datetime_created": "2018-02-05T19:16:57Z",
              "datetime_updated": "2018-02-05T19:16:57Z",
              "pub_id": 2143,
              "url": "https://www.google.com/",
              "channel": null,
              "exclusive_match_requested": true
            },
            {
              "smart_link_id": 211926,
              "auction_id": "1629787851069847260",
              "uid_created": null,
              "datetime_created": "2018-02-05T19:16:57Z",
              "datetime_updated": "2018-02-05T19:16:57Z",
              "pub_id": 2143,
              "url": "https://www.bing.com/",
              "channel": null,
              "exclusive_match_requested": true
            }
          ]
        }
      ]
    }


.. _contact us: mailto:hello@narrativ.com
