---
# Documentation: https://sourcethemes.com/academic/docs/managing-content/

title: "Voltage amplifier"
summary: "A voltage amplifier compatible with Arduino Due"
authors: [andre]
tags: ["fMRI","Psychology","arduino"]
categories: []
date: 2020-02-04T05:44:14Z

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: "center"
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_code: "https://github.com/Sussex-Neuroscience/voltage-amplifier"
url_pdf: ""
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

This system was developed as part of a research project of the [Ward Lab](http://www.sussex.ac.uk/profiles/92444/research). It is to be used with a stimulus isolation adaptor from BIOPAC, more specifically one of the models that provide isolated voltage: https://www.biopac.com/product/stimulus-isolation-adapters/.

The idea is simple, we use the true analog output ports from the Arduino DUE as an independent channel and amplify their signals using Operational amplifiers. In this case two LM741 from Texas instruments. Using serial communication the system can be controlled in various ways, from the Arduino IDE to whatever programming languages (Python, Matlab, etc).

[**Project repository**](<https://github.com/Sussex-Neuroscience/voltage-amplifier>)  