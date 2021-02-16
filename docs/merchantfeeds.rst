Merchant Feeds
================

.. _merchantfeeds_overview:

Overview
--------

Narrativ provides the ability for our publisher partners to download merchant feeds in a standardized format for
monetization.  This enables product data to be integrated into your CMS, allowing for more control over monetization
decisions and integration of multi-button formats.

Feed Schema
-----------

**Please note**: all fields are nullable due to incomplete and/or inapplicable data. The feeds will
only include products that are in-stock at time of file generation.

.. list-table::
   :widths: 40 20 40
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - brand
     - String
     - Name of product brand

   * - colors
     - List<string>
     - List of colors for the product (if applicable)

   * - currency
     - String
     - Currency code of price

   * - description
     - String
     - Description of the product

   * - google_product_category
     - List<string>
     - List of Google Product categories for this product

   * - gtin
     - String
     - Global trade item number; a unique product identifier

   * - image_url
     - String
     - URL of product image

   * - item_group_id
     - String
     - ID for a group of Item IDs

   * - item_id
     - String
     - Individual Item ID

   * - manufacturer
     - String
     -

   * - model
     - String
     -

   * - mpn
     - String
     -

   * - name
     - String
     - Product name

   * - price
     - Float
     - Regular price of product

   * - sale_price
     - Float
     - Sale price of product

   * - sizes
     - List<string>
     - List of sizes for the product (if applicable)

   * - sku
     - String
     - Stock keeping unit; a unique product identifier to specific retailer

   * - store_page_url
     - String
     - Product page URL


Feed Delivery
-------------

Narrativ supports two methods of feed delivery:

**Amazon S3:**
Feeds will be delivered in a shared S3 bucket configured to have a sub-folder for each merchant.

If the publisher has their own AWS account, we will configure a shared S3 bucket that can be owned by either party.
Access will be managed using IAM roles.

If the publisher does not have their own AWS account, we will configure a shared S3 bucket accessed by secret key &
access key. Credentials will be shared in a 1pass vault for security purposes.

**SFTP:**
Feeds will be delivered to publisher’s SFTP location.


Monetization
____________

Product URLs contained in feed are not formatted for Narrativ monetization. There are two available methods to
monetize the product URLs:

    1. `Clickmate`_
    2. `Publisher JS Tag`_


Getting Started
_______________

Please contact your account manager or support@narrativ.com and we will reach out with next steps.

.. _Clickmate: https://docs.narrativ.com/en/stable/clickmate.html

.. _Publisher JS Tag: https://docs.narrativ.com/en/stable/tagpublisher.html
