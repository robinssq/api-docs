Publisher Events
================

Submit New Publisher Events
---------------------------

Request
^^^^^^^

::

    POST /api/v1/events/<event_category>/<event_type>/


Available event categories and types
""""""""""""""""""""""""""""""""""""

**Impressions** track which page elements are being presented to your readers,
while **interactions** track how your readers are engaging with your content.

.. list-table::
   :widths: 15 25 60
   :header-rows: 1

   * - Event Category
     - Event Type
     - Description

   * - impressions
     - page_impression
     - Marks the beginning of a page session. Fire this event once your page
       has loaded and you have generated your Page Session UUID.

   * - impressions
     - bam_link_impression
     - Signals that a SmartLink (Bam Link) has loaded on the page.

   * - impressions
     - bam_link_viewable_impression
     - Signals that a SmartLink (Bam Link) on the page is visible to the user.

   * - interactions
     - bam_link_hover
     - Signals that the user has hovered over the SmartLink (Bam Link) with
       their mouse or other pointing device, **for at least one second**.
       (This event does not apply to mobile websites.)


Event request payload
"""""""""""""""""""""

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - organization_type
     - string
     - This field must always be set to ``publisher``.

   * - organization_id
     - integer
     - Your publisher ID.

   * - user
     - object
     - Information about the current visitor to your site, for analytics.

   * - events
     - list[object]
     - Data for each event that you are submitting. You may submit up to 100
       events per API call.


User information fields
"""""""""""""""""""""""

You must generate and assign a :ref:`Page Session UUID <page_session_tutorial>`
to your events. The other fields listed here provide information about your
site visitor for deeper analytics and are optional. Personal user information
that you submit will be automatically obfuscated by our servers before it is
stored, in accordance with our `privacy policy`_. However, you may elect not
to submit this information at all if your visitor is subject to your own data
collection opt-outs.

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - page_session_uuid
     - string
     - The UUID v4 value that your client has generated for the current
       page session.

   * - source_url
     - string
     - The URL of the current page.

   * - previous_url
     - string
     - Optional. The HTTP Referer URL.

   * - source_user_id
     - string
     - Optional. A unique identifier such as a username for the current
       visitor to your site. (Our servers will automatically hash this
       value before storing it to protect user privacy.)

   * - user_agent
     - string
     - Optional. The HTTP User-Agent.

   * - email
     - string
     - Optional. An email address for the current visitor to your site.
       (Our servers will automatically hash this value before storing it
       to protect user privacy.)


Event data for page impressions
"""""""""""""""""""""""""""""""

Page events currently require no additional data. In the ``events`` list,
send an empty object ``{}``.


Event data for SmartLink (Bam Link) impressions and interactions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

In the ``events`` list, send an object containing the following data for
each SmartLink:

.. list-table::
   :widths: 30 10 60
   :header-rows: 1

   * - Field Name
     - Type
     - Description

   * - auction_id
     - string
     - The Auction ID of the SmartLink.


Response
^^^^^^^^

Empty response. An HTTP 201 status code indicates successful event submission.


Examples
^^^^^^^^

Submitting a single page impression event::

    POST /api/v1/events/impressions/page_impression/

    {
      "organization_type": "publisher",
      "organization_id": 1,
      "user": {
        "page_session_uuid": "8132ac19-109a-466e-8037-540a9bd12798"
      },
      "events": [
        {}
      ]
    }

::

    HTTP/1.1 201 CREATED
    Content-Length: 0


Submitting a group of two SmartLink impression events using a single request::

    POST /api/v1/events/impressions/bam_link_impression/

    {
      "organization_type": "publisher",
      "organization_id": 1,
      "user": {
        "page_session_uuid": "8132ac19-109a-466e-8037-540a9bd12798"
      },
      "events": [
        {
          "auction_id": "1522995078114976993"
        },
        {
          "auction_id": "1522738266273264784"
        }
      ]
    }

::

    HTTP/1.1 201 CREATED
    Content-Length: 0


.. _privacy policy: https://dashboard.narrativ.com/#/privacy-policy
