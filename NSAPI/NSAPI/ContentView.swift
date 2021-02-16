//
//  ContentView.swift
//  NSAPI
//
//  Created by Pieter Bikkel on 16/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    let apiService = APIService.shared
    
    var body: some View {
        Button(action: {
            apiService.getJSON(urlString: "https://gateway.apiportal.ns.nl/reisinformatie-api/api/v3/disruptions?isActive=true", dateDecodingStrategy: .formatted(DateFormatter.RFC3339)) { (result: Result<[NSDisruptions],APIService.APIError>) in
                
                switch result {
                case .success(let forecast):
                    DispatchQueue.main.async {
                        for i in 0..<forecast.count {
                            print("\(forecast[i].type)")
                            print("-")
                        }
                    }
                case .failure(let apiError):
                    switch apiError {
                    case .error(let errorString):
                        print(errorString)
                    }
                }
            }
        }, label: {
            Text("Get data")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





struct NSDisruptions: Codable {
    let type: String
    let title: String
    let isActive: Bool
    let start: Date?
    let expectedDuration: ExpectedDuration?
        struct ExpectedDuration: Codable {
            let description: String
            let endTime: Date
        }
    let summaryAdditionalTravelTime: AdditionalTravelTime?
        struct AdditionalTravelTime: Codable {
            let minimumDurationInMinutes: Int?
        }
    let publicationSections: [PublicationSections]?
        struct PublicationSections: Codable {
            let section: Section?
            struct Section: Codable {
                    let stations: [Stations]?
                    struct Stations: Codable {
                        let stationCode: String?
                        let name: String?
                        let coordinate: Coordinate?
                            struct Coordinate: Codable {
                                let lat: Double
                                let lng: Double
                            }
                    }
                }
        }
    let timespans: [Timespans]?
    struct Timespans: Codable {
        let cause: Cause
        struct Cause: Codable {
            let label: String
        }
    }

}
