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

    Headers_Date = { 
      'accept': '*/*', 
      'accept-language': 'en-US,en;q=0.9', 
      'cache-control': 'no-cache', 
      'client-info': 'shopping-pwa,22c2fa73a284c75100a9f3b70a15135e94fc982d,us-west-2', 
      'content-type': 'application/json', 
      'cookie': 'hav=65e4e843-b9ae-6093-34f5-f6fa86410776; MC1=GUID=65e4e843b9ae609334f5f6fa86410776; DUAID=65e4e843-b9ae-6093-34f5-f6fa86410776; ha-device-id=65e4e843-b9ae-6093-34f5-f6fa86410776; hav=65e4e843-b9ae-6093-34f5-f6fa86410776; _ga=GA1.2.1274306539.1711770723; linfo=v.4,|0|0|255|1|0||||||||1033|0|0||0|0|0|-1|-1; CRQS=t|9001`s|9001001`l|en_US`c|USD; currency=USD; tpid=v.1,9001; _fbp=fb.1.1711869797925.220976921; _gcl_au=1.1.1316567880.1711869801; xdid=71c5813c-efce-47eb-8560-771d2660c124|1711869808|vrbo.com; OptanonAlertBoxClosed=2024-03-31T07:27:19.112Z; HATGC_LOTC=tgt-d1520219-3dea-4665-90c6-b1bbe6f64ace-production.homeaway.com-aws; HASESSIONV3=0bcb9556-bd3c-4adb-9943-102687921b9f; OIP=ccpa|1`ts|1711876572; __gpi=UID=00000d79aeea1fbd:T=1711870036:RT=1712412464:S=ALNI_Ma2S94s1JdsP4xr5_36tOi5uTwoJg; eg_adblock=e=0; s_fid=2AB4DA7FF8A4F792-2BDC07104504C742; CRQSS=e|1; iEAPID=1; s_ppv=%5B%5BB%5D%5D; s_ips=1; AMCVS_C00802BE5330A8350A490D4C%40AdobeOrg=1; ttd_TDID=fdc708a6-2152-451a-aebd-8677d32840a9; session_id=022bda07-294e-4be4-85b5-96c8f5d02dd7; OptanonConsent=isGpcEnabled=0&datestamp=Tue+Apr+23+2024+18%3A57%3A57+GMT%2B0545+(Nepal+Time)&version=202306.2.0&browserGpcFlag=0&isIABGlobal=false&hosts=&consentId=80c0575a-90a0-4dd5-9614-d444bc895f39&interactionCount=1&landingPath=NotLandingPage&groups=C0001%3A1%2CSPD_BG%3A1%2CC0002%3A1%2CC0004%3A1&geolocation=NP%3BP4&AwaitingReconsent=false; SheetBannerClose=yes; EG_SESSIONTOKEN=dFwtvxsQBQAmennVbFgYYvqdauxCrkJlJNztTouMR5Z6RA:d8dYloDhlPZ4YY-i7zdchyGQoqQ1oLc-9Tsqp83pKZLymk97fGdk7V04vu4NR1dnpylpr_8BCWrGDtVRA6RRgg; page_name=page.Hotels.Infosite.Information; QSI_HistorySession=; has=fdff4fb8-a8bc-c657-2702-b15cec9410b0; eg_ppid=cd44d4eb-0872-4d15-b5cf-8966d1b4b8af; pageVisited=true; _uetsid=409405d002b211efb48345043512a6b4; _uetvid=89465ad0ef2f11ee82f5f5162a321ea3; _tq_id.TV-8181636390-1.1968=ba939d0402b62428.1711869798.0.1714015009..; HMS=415c066b-f4f3-41ef-beeb-c15dc2ebd926; ak_bmsc=F15BC215BB5D63B15B1DB5783E9EF5D2~000000000000000000000000000000~YAAQtlI2F/GoT+OOAQAAxk0PFRdTLXdmzMDma5plLHRivgqph9j5OXFGRniBfjhL6kkagdsiN38uDexnOVW+FEm32MhNKiYaoP460LKs8/X4UwB0PYvKzFnco9qsuwnEqps8FkgPNwp8J3NwwkoptKPYix+Zo+NlCW9cSpwIOGM/PZiLjIyzL07XwhOTfLjJ/8dtSHg0NgJkwfv1sDUnLsO/0+2BysMubJoU0BrwzuRd1IMBvQoyE5DLuVYchhLrlTQwNf383WHa4BD7cUtf/x4MV4jNSp15kr12xf+Eb+2Klp/D87saDdFelhVJXf+hnQ5U6gglVPIrmpI82aij6O/9sa0cbNsKTDPG64LqCUWQo9J169zuXYRa5ZUukvILSLX5vO6w6jra; s_ppn=page.Hotels.Infosite.Information; __gads=ID=2f4a5e181c462402:T=1711870036:RT=1714045283:S=ALNI_MbK6TOWindbOIhaxQT0gDZkHaAeJw; __eoi=ID=9b56f8db795d3126:T=1711870036:RT=1714045283:S=AA-Afjal_Xhg3qBbXca3R-5ZhADl; AMCV_C00802BE5330A8350A490D4C%40AdobeOrg=1585540135%7CMCIDTS%7C19839%7CMCMID%7C39838432483836399454225316397242977782%7CMCAAMLH-1714650095%7C3%7CMCAAMB-1714650095%7CRKhpRz8krg2tLO6pguXWp5olkAcUniQYPHaMWWgdJ3xzPWQmdj0y%7CMCOPTOUT-1714052495s%7CNONE%7CMCAID%7CNONE%7CvVersion%7C4.4.0; tracker_device=7763a722-f2f0-4a9a-92e3-a64514e88849; JSESSIONID=214C55F9CB78834F7F666F0E9AC3326C; s_tp=7120; _dd_s=rum=2&id=ea8e1bb0-79ea-452c-9298-fc784cb1c91c&created=1714045282745&expire=1714046421432; cesc=%7B%22lpe%22%3A%5B%22ec30c0b9-edc8-44af-8a38-6c866f27bc4f%22%2C1714045521718%5D%2C%22marketingClick%22%3A%5B%22false%22%2C1714045521718%5D%2C%22lmc%22%3A%5B%22DIRECT.REFERRAL%22%2C1714045521718%5D%2C%22hitNumber%22%3A%5B%2216%22%2C1714045521717%5D%2C%22amc%22%3A%5B%22DIRECT.REFERRAL%22%2C1714045521718%5D%2C%22visitNumber%22%3A%5B%2215%22%2C1714045275555%5D%2C%22ape%22%3A%5B%224c97fb26-4b3c-4114-899f-a2b3ffbc7553%22%2C1714045521718%5D%2C%22entryPage%22%3A%5B%22page.Hotels.Infosite.Information%22%2C1714045521717%5D%2C%22cid%22%3A%5B%22Brand.DTI%22%2C1711869773136%5D%7D; bm_sv=5FC42592676BF5A75A5859D927033A35~YAAQtlI2F4SvT+OOAQAAcw8TFRc9F5zd8ji2xWFe59JUhzNKWe1ygPAyuN2fKsD3g+yAR5BVSGycERAs2DUQViNU8FcDZ+JU0gFDb2mWTtNyVoH7odIv3OzT7iiwHnide2iVEJR0iXIMwJaxmDZ7NifrxsHLUSI8Kub6Z9UO6T5Fd13RqMEcoJ2v74wMLD/btjGU9bc5jGAR67kDgmcv/XMzt8VQGc5UrrswSrc1XtKXeU433CrQxHp41Ua8nhQ=~1; DUAID=65e4e843-b9ae-6093-34f5-f6fa86410776; HMS=415c066b-f4f3-41ef-beeb-c15dc2ebd926; MC1=GUID=65e4e843b9ae609334f5f6fa86410776; bm_sv=5FC42592676BF5A75A5859D927033A35~YAAQ1VI2FwS8NMuOAQAAIvBjFRez3DwC0bclsoW+dFMFJwzUW9JTI20wQGLEbs6OyLE4zDEXuBLeloqnxZ4uqCJdR/jBx3xuZoBQZOIpAx+K6/eeGbvh0jzvjqf2AZjU0GDQnqQNsGtKvlP33PeKkiuUvYt1o6To43D89ndLcESie8llF9X96kHcTR1JHLa1rltT2XQlhfnzSRBDw2vbYKJ8wvCcMKwITpd4bAU2uKHdXpW6hfRsDgcAAs7HbMA=~1; cesc=%7B%22lpe%22%3A%5B%22ec30c0b9-edc8-44af-8a38-6c866f27bc4f%22%2C1714050822114%5D%2C%22marketingClick%22%3A%5B%22false%22%2C1714050822114%5D%2C%22lmc%22%3A%5B%22DIRECT.REFERRAL%22%2C1714050822114%5D%2C%22hitNumber%22%3A%5B%221%22%2C1714050822114%5D%2C%22amc%22%3A%5B%22DIRECT.REFERRAL%22%2C1714050822114%5D%2C%22visitNumber%22%3A%5B%2216%22%2C1714050822114%5D%2C%22ape%22%3A%5B%224c97fb26-4b3c-4114-899f-a2b3ffbc7553%22%2C1714050822114%5D%2C%22entryPage%22%3A%5B%22page.Hotels.Infosite.Information%22%2C1714050822114%5D%2C%22cid%22%3A%5B%22Brand.DTI%22%2C1711869773136%5D%7D; hav=65e4e843-b9ae-6093-34f5-f6fa86410776; ha-device-id=65e4e843-b9ae-6093-34f5-f6fa86410776; has=09ffdff6-0736-a199-33c6-5da7e218056e; hav=65e4e843-b9ae-6093-34f5-f6fa86410776', 
      'origin': 'https://www.vrbo.com', 
      'pragma': 'no-cache', 
      'priority': 'u=1, i', 
      'referer': 'https://www.vrbo.com/4131192ha?chkin=5%2F12%2F2024&chkout=5%2F17%2F2024&d1=2024-05-01&d2=2024-05-10&startDate=5%2F12%2F2024&endDate=5%2F17%2F2024&x_pwa=1&pwa_ts=1714044764575&referrerUrl=aHR0cHM6Ly93d3cudnJiby5jb20vSG90ZWwtU2VhcmNo&useRewards=true&adults=2&destination=73%20W%20Monroe%20St%2C%20Chicago%2C%20IL%2060603%2C%20USA&destType=ADDRESS&neighborhoodId=6132445&latLong=41.8804017%2C-87.63020379999999&privacyTrackingState=CAN_TRACK&sort=RECOMMENDED&userIntent=&selectedRoomType=33563357&selectedRatePlan=0000983f3c557cd440feb6dc64f403e5eaa2&expediaPropertyId=33563357&l10n=%5Bobject%20Object%5D&allowPreAppliedFilters=true&amenities=&chain=&daysInFuture=&origin=&group=&guestRating=&hotelName=&lodging=&paymentType=&bedType=&cleaningAndSafetyPractices=&poi=&price=&regionId=&neighborhood=&roomIndex=&selected=&star=&stayLength=&theme=&travelerType=&bedroomFilter=&deals=&propertyStyle=&misId=&rewards=&pickUpTime=&dropOffTime=&commissionTiers=&agencyBusinessModels=&mealPlan=&cabinClass=&tripType=&airlineCode=&directFlights=&infantsInSeats=&driverAge=&partialStay=false&vacationRentalsOnly=false&mapBounds=&stayType=&house_rules_group=&highlightedPropertyId=&bed_type_group=&stay_options_group=&hotel_brand=&multi_neighborhood_group=&logger=%5Bobject%20Object%5D&petsIncluded=false&bedroom_count_gt=&us_bathroom_count_gt=&pricing_group=&rm1=a2', 
      'sec-ch-ua': '"Chromium";v="124", "Google Chrome";v="124", "Not-A.Brand";v="99"', 
      'sec-ch-ua-mobile': '?0', 
      'sec-ch-ua-platform': '"Windows"', 
      'sec-fetch-dest': 'empty', 
      'sec-fetch-mode': 'cors', 
      'sec-fetch-site': 'same-origin', 
      'traceparent': '00-00000000000000006d671eb4891bdca3-72b462135d771bde-00', 
      'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 
      'x-datadog-origin': 'rum', 
      'x-datadog-parent-id': '8265339051443690462', 
      'x-datadog-sampling-priority': '0', 
      'x-datadog-trace-id': '7883303433478593699', 
      'x-page-id': 'page.Hotels.Infosite.Information,H,30', 
      'x-parent-brand-id': 'vrbo', 
      'x-product-line': 'lodging'
  }.freeze

    # create payload dynamically based on address, starting_index and page_size
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
                  "dateRange": {
                    "checkInDate": {
                        "day": 1,
                        "month": 5,
                        "year": 2024
                    },
                    "checkOutDate": {
                        "day": 10,
                        "month": 5,
                        "year": 2024
                    }
                },
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

    def self.create_data_availability_payload(property_id)
      today= Date.today
      day = today.day
      month = today.month
      year = today.year
      next_year = year+1
      return [
        {
          "operationName": "PropertyAvailabilityQuery",
          "variables": {
            "eid": property_id,
            "dateRange": {
              "end": {
                "day": day,
                "month": month,
                "year": year
              },
              "start": {
                "day": day,
                "month": month,
                "year": year
              }
            },
            "context": {
              "siteId": 9001001,
              "locale": "en_US",
              "eapid": 1,
              "currency": "USD",
              "device": {
                "type": "DESKTOP"
              },
              "identity": {
                "duaid": "65e4e843-b9ae-6093-34f5-f6fa86410776",
                "authState": "ANONYMOUS"
              },
              "privacyTrackingState": "CAN_TRACK",
              "debugContext": {
                "abacusOverrides": []
              }
            }
          },
          "extensions": {
            "persistedQuery": {
              "version": 1,
              "sha256Hash": "a5faaea405d10b5533931158695480ffc7f2bec5094b02544abbbf15e47d58c2"
            }
          }
        }
      ]
    end

end