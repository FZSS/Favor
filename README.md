
#Favor
## Author
* Kevin Fangzhou Chen

## Presentation Link
[Youtube](https://www.youtube.com/watch?v=5z8cA8CfL6Q)

## Purpose 
Favor is an app that allow users to offer or ask for favors online for free or a fee.

## Features
* As a user, I will be able to post what favor I am asking for; depending how much I want it, the favor could be free or comes with a bounty. The price is set with a slider [Free --- $$$].
* The app will push notify users nearby. If any user accept the favor, they will see the address of the requester. Once the favor is delivered, he or she will earn the bounty.
* Users can sign up to be notified, for certain items or time frames.

##	Control Flow
* A requester, open an app, would be presented with a view to specify what favor is needed and how much money he is willing to pay. For example, I forgot my pencil whiling studying in the library, unwilling to go back fetching pencils from home. I open the app, specify pencil, put a bounty of $1.

* Then as a favor-doer will receive a push notification of the categories, e.g. stationery, which I have signed up to receive. 

* If the favor-doer accepts it, he or she will be presented the contact info and address of the requster. The transcation happens offline.

* Finally, the requester confrims the favor is received.


## Implementation

### Model
* Favors
* Users
* Transactions 

### View
* PostFavorView
* SignUpCategoriesTableView
* RequesterInfoDisplayView
* ConfirmView
* MapView <- maybe, to show when the person arrives, how many minutes away

### Controller
* PostFavorViewController
* SignUpCategoriesTableViewController
* ConfirmViewController
