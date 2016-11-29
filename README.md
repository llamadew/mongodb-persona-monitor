# Persona Monitor

A customizable information radiator for personas, built with [Middleman](https://middlemanapp.com), and [Basscss](http://basscss.com/).

## Installation

Clone the repository
```
git clone git@github.com:mattrothenberg/persona-monitor.git
```

Install the required gems
```
bundle install
```

Spin up the development server, via the Middleman CLI
```
middleman serve
```

Open Chrome and head to [http://localhost:4567](http://localhost:4567)
```
open localhost:4567
```

## Building / Deploying
Build the site via the Middleman CLI
```
middleman build
```

Deploy the `/build` directory however you'd like.

## Customization

All of the persona data lives in `data/personas.yml`.

Feel free to add as many objects to the `personas` array as you'd like. For the time being, they _must_ adhere to the following structure, as the application expects these (and only these) attributes to be available.

```yaml
---
personas:
  - display_name: Bob Smith
    title: Chief Executive Officer
    portrait: 'images/bob-smith.png' # relative path to the images dir. Be sure to add your image!
    objective: objective goes here
    quote: quote goes here
    tools:
      - this is a tool
    behaviors:
      - this is a behavior
    needs:
      - this is a need
    frustrations:
      - this is a frustration
    attribution: http://google.com
 ````

For the time being, the grid layout in `index.html.erb` is optimized for **3** personas. Adjust the grid to your liking, but be warned that you'll likely need to tweak some CSS accordingly.
