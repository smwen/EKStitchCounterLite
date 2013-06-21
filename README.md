EKStitchCounterLite
=========================

An iPhone app for counting stitches or other features while knitting. This is primarily a learn-to-code app for understanding UITableView.

Purpose
-------

Stitch counters are often used to keep track of the number of stitches or rows knitted. For example, a counter could be used when decreasing or increasing the width of a knitting project (such as in a jacket sleeve); typically every nth row will be decreased by 2 stitches, over ~100 rows. Physical stitch counters (with dials or buttons to increment the numbers) are already sold in knitting stores.

This app allows the user to record the number of stitches or rows knitted. A user can increment the counter easily while knitting.

Project Thoughts
----------------
This project was used to understand UITableView, with a customized subclass of UITableViewCell (EKStitchCounterTableViewCell) that contains buttons and labels that update. I discovered that it is difficult to space table cells by using the functions in UITableView; hacks would involve accessing the CALayer, using images in intermediary cells, or in this case by using sections.

Future
------
Since making this app, I have learned about UITableViewHeaderFooterView, a new class in iOS 6 which can be used to change the header appearance. This might be another way to change spacing between elements in the table.
For completeness, the TableView should better implement the various protocols for data source and delegate.
