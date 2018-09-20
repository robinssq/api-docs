Auctions
========

Usage
-----

The Auction API runs an auction on a SmartLink and returns an updated
destination URL for the link. You can use this API to write your own custom
publisher Javascript tags. Be sure to read through the :doc:`tutorial <tagpublishercustom>`
before proceeding.

.. note:: The Auction API does not require client authentication, but may be
   subject to rate-limiting if called an extreme number of times from the
   same origin.

Run Auction
-----------

Request
^^^^^^^

::

    GET /api/v1/auction/

.. list-table::
   :widths: 10 10 80
   :header-rows: 1

   * - Query Param
     - Type
     - Description

   * - a
     - string
     - Auction ID. This is the number at the end of your SmartLink.
       For example, the SmartLink ``https://shop-links.co/1522995078114976993``
       has the Auction ID ``1522995078114976993``.

   * - t
     - integer
     - Cache-busting parameter. Set this to a randomly-generated number to
       prevent HTTP caching of the auction request and response.

   * - uuid
     - string
     - Page Session UUID. The UUID v4 value that your client has generated for
       the current page session.

.. NOTE: Custom publisher tags do not run bam box auctions, since bam boxes
   have their own embedded tag. To avoid confusion, we avoid documenting the
   bam box parameters.


Response
^^^^^^^^

Auction result data
"""""""""""""""""""

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - auction_result . **id**
     - string
     - A unique identifier for the result of the auction.

   * - auction_result . **product**
     - object
     - Product information for the advertiser that won the auction.

   * - auction_result . **redirect_url**
     - string
     - The new destination URL for the SmartLink.

   * - auction_result . **tracker_urls**
     - object
     - Third-party event tracker URLs for this SmartLink placement.
       Your client is responsible for firing all trackers listed here when the
       applicable event(s) occur.

   * - **impression_pixel_url**
     - string
     - The primary impression event tracker URL for this SmartLink placement.
       Your client is responsible for firing this tracker after receiving
       the auction response.


Product information (auction_result.product)
""""""""""""""""""""""""""""""""""""""""""""

Auction API responses may provide the following information about the
advertiser (retailer/merchant) and the product page that will be receiving
the click on the rewritten SmartLink:

.. list-table::
   :widths: 35 10 55
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - **id**
     - integer
     - A unique identifier for the product that the destination URL refers to.

   * - **name**
     - string
     - The name of the product being sold.

   * - **price**
     - string
     - The price of the product being sold, in USD.

   * - **url**
     - string
     - The raw URL of the product page, for display purposes. (Do not rewrite
       the SmartLink with this URL.)

   * - **image_url**
     - string
     - The image URL of the product being sold, for display purposes.

   * - **is_in_stock**
     - boolean
     - The stock status of the product being sold.

   * - merchant . **id**
     - integer
     - A unique identifier for the advertiser.

   * - merchant . **canonical_host**
     - string
     - The host part of the advertiser's website URL, for display purposes.

   * - merchant . **name**
     - string
     - The name of the advertiser.

   * - merchant . **url**
     - string
     - The full URL for the advertiser's home page.


Third-party event trackers (auction_result.tracker_urls)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Auction API responses may include the following set of third-party event
trackers that apply to your SmartLink placement:

.. list-table::
   :widths: 30 70
   :header-rows: 1

   * - Event Tracker Type
     - Event Description

   * - impression
     - Signals that at least one occurrence of this SmartLink has been
       loaded on the page. You may fire this event tracker immediately
       after receiving the auction response.

   * - viewable_impression
     - Fire this event tracker once any occurrence of this SmartLink is
       scrolled into view on the page.

Tracker URLs may include the template parameter ``{RAND}``, which must be
replaced with a randomly-generated number for cache-busting prior to firing
the tracker.

Do NOT fire a third-party event tracker more than once per page for the same
event, even if the same SmartLink appears multiple times on that page.


Example
^^^^^^^

::

    GET https://api.bam-x.com/api/v1/auction/
        ?a=1629223267830557131
        &t=1517261651
        &uuid=8132ac19-109a-466e-8037-540a9bd12798

::

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "info": {
        "error": false,
        "status": 200
      },
      "data": [
        {
          "auction_result": {
            "id": "1629224701990881693",
            "auction_id": "1629223267830557131",
            "redirect_url": "https://api.bam-x.com/api/v1/redirect/?a=1629223267830557131&uid_bam=1629224701957143181&ar=1629224701990881693&url=https%3A%2F%2Fwww.amazon.com.example%2F&uuid=8132ac19-109a-466e-8037-540a9bd12798",
            "product": {
              "merchant": {
                "url": "https://www.amazon.com/",
                "canonical_host": "amazon.com",
                "id": 2186,
                "name": "Amazon"
              },
              "bamx_product_category_id": 3,
              "name": "Designer Handbag",
              "url": "https://www.amazon.com.example/product/1234",
              "image_url": "https://www.static.amazon.example/image/path/1234",
              "is_in_stock": true,
              "price": "299.99",
              "id": 8030310
            },
            "tracker_urls": {
              "viewable_impression": [
                "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;kw=lv;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?",
                "https://ad.atdmt.com.example/1111?r={RAND}"
              ],
              "impression": [
                "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;kw=li;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?",
                "https://ad.atdmt.com.example/2222?r={RAND}"
              ]
            }
          },
          "impression_pixel_url": "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?"
        }
      ]
    }
