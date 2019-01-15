This project has five separate problems, with five separate spec files. Run
them in the following order:

1. `00_hello_spec.rb`
1. `01_temperature_spec.rb`
1. `02_calculator_spec.rb`
1. `03_simon_says_spec.rb`
1. `04_pig_latin_spec.rb`

**NB** All files in the `lib` directory except `00_hello.rb` are intentionally empty. You will need to open the spec files listed above for instructions for each problem.

# How to navigate to your project's directory

1. Click download link to download the zipped project folder
1. Open the folder in Finder (on Chrome you can click the arrow next to the downloaded folder and select “Show in Finder”)
1. Double click the zipped folder to extract the contents in the current directory
1. Open the Terminal application (cool shortcut: `cmd + space` to open Spotlight Search, search for `Terminal`, press enter)
1. Drag the newly extracted folder from Finder down to your dock and drop it onto the Terminal application (this is an easy way to change directory into that folder!)

If you are not sure if this worked, type into terminal `pwd`, short for print working directory. It should be the directory with the `README`, the `lib` folder, and the `spec`.

Pro-Tip: Make sure the Terminal application is pinned to your dock for easy access by right clicking it in your dock and selecting Options > “Keep In Dock”

# Getting Started

1. Make sure you have installed `bundler` from the [installation reading][install-rspec]. You only need to perform this installation once.
1. In terminal, run `bundle install` to install the gems specified by the Gemfile in your project directory. We need to this run command for every project.
1. In terminal, run `atom .` to open up the current directory in the atom text editor
1. In atom, open the `lib` folder and write the code to pass the specs (Yay, we are programmers!)
1. Return to the Terminal and run the specs again until everything is passing. If you do not know how to run the specs please look at the commands below.

## How to Run All Spec Files

+ `bundle exec rspec`: This will run all of the tests in the `spec` directory.
+ If you got the error `bundle: command not found`, make sure you installed rspec as specified in the [installation reading][install-rspec].

## How to Run One Spec File

Sometimes it's useful to run just a single test spec file, or a subgroup of tests.
This is often the case when working with long, slow spec files.

+ In terminal, run `bundle exec rspec spec/<file_name.rb>`
  + Ex: `bundle exec rspec spec/00_hello_spec.rb`: This will run the one file instead of all five spec files.

## How to Run One Line from One Spec File

+ `bundle exec rspec spec/<file_name.rb>:<line_number>`
  + Ex: `bundle exec rspec spec/00_hello_spec.rb:3`: This will run the test on line 3 instead of all the tests in the `00_hello_spec.rb` file.

# Helpful Hints

+ Getting stuck on a test spec?
  + If you are unsure why you are failing a test, open the spec and try your best to understand how it is being tested.
+ Tired of scrolling to the top of the specs?
  + Try this terminal shortcut `cmd + up`
+ Getting linter errors?
  + You can post a screen shot of your atom editor with the linter error at [Discourse Forum][forum] for assistance.
  + You can disable the Rubocop linter in settings > packages for now we can fix it when you start at App Academy

[install-rspec]: ./3-installing_rspec
[forum]: https://appacademy-online.trydiscourse.com/