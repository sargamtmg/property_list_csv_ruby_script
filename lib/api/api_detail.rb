module APIDetail
    Url = "https://www.vrbo.com/graphql".freeze

    Headers = {
        'Content-Type': 'application/json',
        'authority': 'www.vrbo.com',
        'accept': 'application/json, text/plain, */*',
        "accept-language": "en-GB,en-US;q=0.9,en;q=0.8,no;q=0.7,de;q=0.6",
        "Accept-Encoding": "gzip, deflate, br",
        Connection: "keep-alive",
        "cache-control": "no-cache",
        "client-info": "shopping-pwa,unknown,unknown",
        origin: "https://www.vrbo.com",
        pragma: "no-cache",
        referer:
            "https://www.vrbo.com/search?adults=2&amenities=&children=&d1=2023-12-27&d2=2023-12-28&destination=73%20W%20Monroe%20St%2C%20Chicago%2C%20IL%2060603%2C%20USA&endDate=2024-03-05&latLong=&mapBounds=&pwaDialog=&regionId&semdtl=&sort=RECOMMENDED&startDate=2024-03-01&theme=&userIntent=",
        "sec-ch-ua":
            '"Not_A Brand";v="8", "Chromium";v="120", "Google Chrome";v="120"',
        "sec-ch-ua-mobile": "?0",
        "sec-ch-ua-platform": '"macOS"',
        "sec-fetch-dest": "empty",
        "sec-fetch-mode": "cors",
        "sec-fetch-site": "same-origin",
        "user-agent":
            "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "x-enable-apq": "true",
        "x-page-id": "page.Hotel-Search,H,20",
        Cookie:
            "DUAID=f3995387-24c9-b93a-dc50-6e607ed76554; HMS=7da2d321-3e58-46af-b148-045edf151737; MC1=GUID=f399538724c9b93adc506e607ed76554; ak_bmsc=C63B62E1317497F6D5574DB5A3DF6D3D~000000000000000000000000000000~YAAQH2fRFwOrhpCOAQAACt/5kxcy6ARVvTmxrsmbzO28iyEPdb8EFHRhLd2+zQhlfUqZl31qrrz4uEi3TE/JDbAjj+R3Zo2DQ86MHosSI17jDR+Y9IdMEEUr7fYz8ZF4rUgp6VL9vFvUFgjpd1jWJvrRdwOsVeasINPwpbl9GmFSTqVBNUKJjd4lLEaWYsrcOZEtQ96tOxH71KNLbqHDeDRglFyeq38W57QCzEtnTSiDroBBX+fKFGjLaII0mAi8ifDD8fHKtBQguxgWeug9SV/qT/yVCxN2r1OONQUjbEzp4Fgz3HYCJCwHl8f1mFRMZb42sihg0fYVv/ZhWzYAMtS3rT3iv5vML9Clyi0OFoWnLQwVjtiztvCcHoimC8MhzAiqLs2NiQ==; bm_sv=CA5A1181919EDE3A2962CE430526F88B~YAAQtlI2FxYwUYeOAQAAOnBSlBfq3TsnIuoJ0BxFD4DmpMXIAOK29ZPwvGktJTfxUPHpf0uO3Ko8NfwuC88PsQfrC3OZiGKsOdkTiX4eunHf7cnQby4ITerLnfDVAybr3NdVuoXQF1NiW5CzUS9yzogLoALXQEe0Y7S96NnPLm2Z4BMKbTWDwXi5cmYYLAlhJNl3vFiGevRJT8hsIaaLGcaPhiLhd95DKNebVgtN6+DHyJHCghX1IYmB66jMk1Y=~1; cesc=%7B%22marketingClick%22%3A%5B%22false%22%2C1711885414428%5D%2C%22hitNumber%22%3A%5B%222%22%2C1711885414428%5D%2C%22visitNumber%22%3A%5B%229%22%2C1711885357072%5D%2C%22entryPage%22%3A%5B%22page.Hotel-Search%22%2C1711885414428%5D%7D; hav=f3995387-24c9-b93a-dc50-6e607ed76554; ha-device-id=f3995387-24c9-b93a-dc50-6e607ed76554; has=f1e9ad13-02d1-6c07-590d-86d589df730d; hav=f3995387-24c9-b93a-dc50-6e607ed76554",
    }.freeze

    def self.create_payload(address,starting_index,page_size=50)
        return {
            "variables": {
              "context": {
                "siteId": 9001001,
                "locale": "en_US",
                "eapid": 1,
                "currency": "USD",
                "device": {
                  "type": "DESKTOP"
                },
                "identity": {
                  "duaid": "65cbd87c-ebb5-ab83-a4c1-812db78bb787",
                  "expUserId": "-1",
                  "tuid": "-1",
                  "authState": "ANONYMOUS"
                },
                "privacyTrackingState": "CAN_TRACK",
                "debugContext": {
                  "abacusOverrides": []
                }
              },
              "criteria": {
                "primary": {
                  "dateRange": nil,
                  "destination": {
                    "regionName": address,
                    "regionId": nil,
                    "coordinates": nil,
                    "pinnedPropertyId": nil,
                    "propertyIds": nil,
                    "mapBounds": nil
                  },
                  "rooms": [
                    {
                      "adults": 2,
                      "children": []
                    }
                  ]
                },
                "secondary": {
                  "counts": [
                    {
                      "id": "resultsStartingIndex",
                      "value": starting_index
                    },
                    {
                      "id": "resultsSize",
                      "value": page_size
                    }
                  ],
                  "booleans": [],
                  "selections": [
                    {
                      "id": "sort",
                      "value": "RECOMMENDED"
                    },
                    {
                      "id": "privacyTrackingState",
                      "value": "CAN_TRACK"
                    },
                    {
                      "id": "useRewards",
                      "value": "SHOP_WITHOUT_POINTS"
                    },
                    {
                      "id": "searchId",
                      "value": "d1342ebe-2e4c-4c8d-8838-a3967204a6f2"
                    }
                  ],
                  "ranges": []
                }
              },
              "destination": {
                "regionName": nil,
                "regionId": nil,
                "coordinates": nil,
                "pinnedPropertyId": nil,
                "propertyIds": nil,
                "mapBounds": nil
              },
              "shoppingContext": {
                "multiItem": nil
              },
              "returnPropertyType": false,
              "includeDynamicMap": true
            },
            "operationName": "LodgingPwaPropertySearch",
            "extensions": {
              "persistedQuery": {
                "sha256Hash": "e4ffcd90dd44f01455f9ddd89228915a177f9ec674f0df0db442ea1b20f551c3",
                "version": 1
              }
            }
        }
    end

end