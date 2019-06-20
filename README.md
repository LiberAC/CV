# CV
Simple app to consult a web service to show a CV

- [Usage Description](#usage)
- [Building considerations](#building-considerations)
- [TODO](#todo)

## Usage

- This project consult https://gist.github.com/LiberAC/c48d1f23d1602735cc78ca2095cdcc31

This app have one screen , which displays a UITableView with 3 sections , each one has a different UITableViewCell.


## Building Considerations

The architecture is as follows:

- There is an APIClient doing the networking calls using the URLSession API
- MVVM.
- The data source for the table that holds the CV values is in a separate class that handles the dataSource delegate.

## TODO

- Add a reachability network.
