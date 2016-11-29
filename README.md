# Persona Monitor
http://persona-monitor.cfapps.io/

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

Persona Monitor uses a 12 column grid system, but allows you to specify how many columns you would like one Persona tile to span on viewports larger than `40em`.

At the top of `index.html.erb`, tweak the local `sm_col_modifier` variable to specify how many columns (out of 12) one tile should span. 4 (out of 12) means that a single tile spans 33.3% width; 6 (out of 12) means 50% width, etc.
