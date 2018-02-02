Custom Publisher Tags
=====================

Getting Started
---------------

The fastest way to get started on the Narrativ platform is to use our provided
Javascript tag. Our publisher tag automatically finds the SmartLinks on your
page, updates their destination URLs, and tracks user interaction with them.
However, if you have a special use case not covered by our default tag, it is
possible to write your own custom integration with our APIs.


Page Session Tracking
---------------------

To provide the most accurate performance data on your SmartLinks, Narrativ
tracks page session events on your website. These events are grouped by a
randomly-generated unique identifier called the **Page Session UUID**.
This identifier is a `UUID v4`_, which looks something like:

.. code-block:: none

    8132ac19-109a-466e-8037-540a9bd12798

Your tag will need to generate a new Page Session UUID each time a reader
lands on a different page/article. Include this value where indicated when
submitting events on your page. Do not reuse Page Session UUIDs across
different pages or different users.

.. note:: If you have a single-page application (SPA), generating a new
   Page Session UUID on Javascript load may not be enough! Ensure that your
   UUID changes every time the reader navigates to a new article.

.. TODO: Page Load Events


SmartLinks
----------

Pages with Existing SmartLinks
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Next, your tag must identify the SmartLinks in your article which need to
have their destination URLs updated. All SmartLinks have the following
format::

    https://shop-links.co/<auction_id>

.. NOTE: Custom publisher tags should ignore shop-edits. Bam boxes have
   their own embedded tag independent from the publisher page tag (since
   bam boxes are loaded in iframes). We also omit information about the
   legacy bam link formats `#bamx-` and `#bamx:`.

For example::

    https://shop-links.co/1611792246540568252

Each SmartLink has an **Auction ID**, a unique 64-bit integer identifying
the link.

.. TODO: LinkMate: Automatic SmartLink Creation

.. TODO: Impression Events

.. warning:: Even though the Auction ID is an integer, you must store it as a
   string in Javascript. Javascript ``Number`` types are not large enough to
   hold 64-bit integers, resulting in data corruption.


Auctions
--------

For each distinct Auction ID on your page, submit an :doc:`Auction API <auction>`
request to obtain the new destination URL. For example::

    GET https://api.bam-x.com/api/v1/auction/
            ?a=1522995078114976993
            &t=1517261651
            &uuid=8132ac19-109a-466e-8037-540a9bd12798

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
            "id": "1629147433127336253",
            "auction_id": "1522995078114976993",
            "redirect_url": "https://api.bam-x.com/api/v1/redirect/?a=1522995078114976993&uid_bam=1629147432580451822&ar=1629147433127336253&url=http%3A%2F%2Fwww.shopbop.com.example%2Fkarda-lace-bootie-iro%2Fvp%2Fv%3D1%2F1533877648.htm%3Fsite_refer%3Dbam%26utm_source%3Dbam%26utm_medium%3Dcpc%26utm_campaign%3Dbam%2Bpremium%2Beditorial%26&uuid=8132ac19-109a-466e-8037-540a9bd12798"
          }
        }
      ]
    }

Then, replace the ``href`` of your link with the new URL. So, an original
link that looks like this::

    <a href="https://shop-links.co/1522995078114976993" target="_blank">Shop Now</a>

will become::

    <a href="https://api.bam-x.com/api/v1/redirect/?a=1522995078114976993&uid_bam=1629147432580451822&ar=1629147433127336253&url=http%3A%2F%2Fwww.shopbop.com.example%2Fkarda-lace-bootie-iro%2Fvp%2Fv%3D1%2F1533877648.htm%3Fsite_refer%3Dbam%26utm_source%3Dbam%26utm_medium%3Dcpc%26utm_campaign%3Dbam%2Bpremium%2Beditorial%26&uuid=8132ac19-109a-466e-8037-540a9bd12798" target="_blank">Shop Now</a>

Sometimes the same SmartLink appears multiple times in a single article.
For instance, you may have a clickable slideshow image and some caption text
for the same featured product in your story. In this case, your tag should
only submit one Auction API request and update both links to the same
destination URL.


Third-Party Event Trackers
--------------------------

Some of our retail partners request us to fire their event trackers each time
their product links appear on a publisher page. These trackers provide
additional insights on your SmartLink performance and help us further optimize
your revenue. Auction API responses will list the third-party impression
trackers and viewable impression trackers that apply to your SmartLink.
For example::

    GET https://api.bam-x.com/api/v1/auction/
            ?a=1522995078114976993
            &t=1517261651
            &uuid=8132ac19-109a-466e-8037-540a9bd12798

    HTTP/1.1 200 OK
    Content-Type: application/json

    {
      "info": {
        "error": false,
        "status": 200
      },
      "data": [
        {
          "impression_pixel_url": "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?",
          "auction_result": {
            "tracker_urls": {
              "viewable_impression": [
                "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;kw=lv;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?"
              ],
              "impression": [
                "https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;kw=li;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?"
              ]
            },
            "id": "1629147433127336253",
            "auction_id": "1522995078114976993",
            "redirect_url": "https://api.bam-x.com/api/v1/redirect/?a=1522995078114976993&uid_bam=1629147432580451822&ar=1629147433127336253&url=http%3A%2F%2Fwww.shopbop.com.example%2Fkarda-lace-bootie-iro%2Fvp%2Fv%3D1%2F1533877648.htm%3Fsite_refer%3Dbam%26utm_source%3Dbam%26utm_medium%3Dcpc%26utm_campaign%3Dbam%2Bpremium%2Beditorial%26&uuid=8132ac19-109a-466e-8037-540a9bd12798"
          }
        }
      ]
    }

Impression trackers should be fired immediately, while viewable impression
trackers should be fired once any occurrence of the SmartLink on the page
is scrolled into view.

.. NOTE: Since custom publisher tags do not run bam box auctions, they will
   not receive auction responses containing bam box campaign event trackers.

Tracker URLs may include the template parameter ``{RAND}``, which must be
replaced with a randomly-generated number prior to firing the tracker.
This parameter is used to prevent HTTP caching of the tracker request and
response::

    https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;ord={RAND};dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?"

To fire an event tracker, insert a new hidden HTML ``IMG`` tag with the
tracker URL as the image source::

    <IMG SRC="https://ad.doubleclick.net.example/ddm/trackimp/N1234.1234567NARRATIV/B12345678.123456789;dc_trk_aid=123456789;dc_trk_cid=12345678;ord=1629147433127336253;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=?" />

Do NOT fire a third-party event tracker more than once per page for the same
event, even if the same SmartLink appears multiple times on that page.


Product and Advertiser Information
----------------------------------

When the auction system identifies an advertiser (retailer/merchant) that is
eligible to receive the click on a SmartLink, it may return additional
contextual information about the advertiser and the product being sold.
For example::

    GET https://api.bam-x.com/api/v1/auction/
        ?a=1629223267830557131
        &t=1517261651
        &uuid=8132ac19-109a-466e-8037-540a9bd12798

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
              "price": "299.99",
              "id": 8030310
            }
          }
        }
      ]
    }

Your tag can use this information to dynamically update the text of your
article for a better reader experience.

.. TODO: add example

.. _UUID v4: https://tools.ietf.org/html/rfc4122#section-4.4
