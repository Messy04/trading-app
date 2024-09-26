# trading_app
A demo flutter project to see Real-Time crypto data.

## About
The application consists of 3 screens.

a.) Home screen, where user will have an option to choose which list they want to view
    for now, it has only one `Crypto List` in future it can have options such as `Stocks list`,
    `Funds list` and more.

b.) Second screen is the list of Crypto screen, where a user can view the list of all crypto
    currencies provided by an API. The list is static and doesn't update Real-Time data due
    to some rate limiting on frequent API calls.

c.) Third screen, where the details of a particular coin can be viewed at Real-Time provided by
    a web socket server.

## Entities
`SymbolEntity`
It has every information about a particular `Crypto Currency`

`CryptoTickerEntity`
It has information of a `Crypto Currency` at Real-Time

## APIs
https://api.coingecko.com/api/v3 - Get the list of all the symbols and it's properties

wss://stream.binance.com:9443/ws - Websocket url to get the Real-Time update of a particular symbol

## Communication
The `GetCryptoList` API communicates using standard HTTP protocol which sends request and receives response from the server
synchronously.

Whereas `WebSocket` url communicates as Peer to Peer communication where any update at the server informs the client
immediately

## Architecture & Dependencies
The application follows [MVVM] Architecture which is divided into three layers

1. Data Layer (`Model`)
   -
   - Consists of [Models], [Repository] (Concrete implementation) and the [Data Source] (Remote)
   - Models extends Entity classes with json encoding and decoding methods, since models can't be accessed from views.
   - Repositories contains concrete implementation of abstract repositories in Domain Layer.
   - Datasource holds the data from the API
   
2. Domain Layer (`ViewModel`)
   -
   - Consists of [Entity], [Repository] (Abstraction) and [BLoC] (Business logic)
   - Entities are Real world business entities required for the application.
   - Repository are abstract classes which will be called from the BLoC implementing the main Business logic
   - BLoC implements the main Business logic for a particular screen of a particular feature
   
3. Presentation Layer (`View`)
   -
   - Consists of [Pages] and [Widgets]
   - Pages are the UI element visible to the user
   - Widgets are the building bloc helping in creating the visible UI elements


The dependency of the application flows from View to Model i.e 
[Presentation Layer] -> [Domain Layer] -> [Data Layer]
[View] -> [ViewModel] -> [Model]

## Testing
Testing of the application mainly consists of UI and BLoC testing.
- Where UI testing covers most of the UI elements layout on the visible screen and,
- BLoC Testing covers all the business logic used inside the application.

