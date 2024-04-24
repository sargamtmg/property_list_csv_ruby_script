# CSV generation of property list

This script fetches data from an API based on the provided address and page size, and generates a CSV file containing property listing information.

## Setup

### Installation
1. Clone this repository to your local machine:

   ```bash
   git clone <repository_url>
   ```
### Usage
Run the script main.rb with the following command:
```bash
ruby main.rb <address> <page_size>
```
Replace `<address>` with the desired address and `<page_size>` with the number of listings per page.

### Example:
```bash
ruby main.rb "73 W Monroe St, Chicago, IL 60603, USA" 50
```
### Script Files
- **main.rb**: Entry point of the script. Parses command-line arguments, calls the API to fetch property listings, and generates a CSV file.
- **api_detail.rb**: Contains API details such as URL, headers, and payload structure.
- **fetch_property_list.rb**: Handles fetching property listings from the VRBO API and processing the response.
- **csv_generator.rb**: Generates a CSV file containing the listing details.

## Output

The script generates a CSV file named `listing_<timestamp>.csv` in the folder named listings, containing the following columns:

- Listing ID
- Listing Title
- Nightly Price
- Listing URL
