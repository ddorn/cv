#set page(margin: (x: 0.5cm, top: 0.0cm, bottom: 0.5cm))

#let accent = rgb("#f8f3ec")  // For headers background
#let accent-strong = rgb("#CDA56D")  // for bold text
#let accent-weak = rgb("d0bab0")  // for links
#let side = 3cm
#let entry-sep = -0.0cm  // to make things fit in one page
#let use-stars = false
#let use-stars = true

// Style for the colored headings
#show heading.where(level: 1): heading => {
  v(-0.3cm)
  rect(
    // radius: 5pt,
    fill: accent,
    stroke: (bottom: black),
  )[#smallcaps[#heading.body] #h(1fr)]
}
// Underline the links
#show link: it => underline(it, stroke: accent-weak)

// Emojis taken from https://github.com/ariabuckles/twemoji-svg/tree/master/assets/svg
// Unicode point can be looked up https://www.emojiall.com/en/code/1F4C4
// You can add new emojis&flags in the images/ folder. Note that typing emojis directly in the text with render in the preview, but not work inside the pdf (the preview is a png! :o)
#let emoji-svg(name, is-flag: false) = {
  h(0.3em, weak: true)
  box(baseline: 0em, height: 0.666em)[#image("images/" + name + ".svg", height: 1em)]
}
#let flag(name) = {
  h(0.3em, weak: true)
  box()[#move(dy: -0.2em)[
    #box(height: 0.66em)[#image("images/" + lower(name) + ".svg", height: 0.9em)]
  ]]
}

#let countries = (
  "fr": "France",
  "uk": "UK",
  "de": "Germany",
  "ch": "CH",
  "be": "Belgium",
)


#let loc(city, country) = { city; flag(country) }
// #let loc(city, country) = { city; if country != "earth" [,  #upper(country)]}
// #let loc(city, country) = { city; ", "; (countries.at(lower(country)))}
#let Paris = loc("Paris", "fr")
#let Lausanne = loc("Lausanne", "ch")
#let Berlin = loc("Berlin", "de")
#let Cambridge = loc("Cambridge", "uk")
#let London = loc("London", "uk")
#let Bruxelles = loc("Bruxelles", "be")
#let Europe = loc("Across Europe", "europe")


#let entry(name, descr, dates, loc, url: none, star: false) = [
  #grid(columns: (side, auto),
    gutter: 0.6cm,
    // inset: (x: 0.3cm),
    // stroke: black,
    align: (right, left),
    [ //#if star { place(emoji-svg("star"), dx: -0.0em, dy: -0.0em)}
      #loc \
      _#dates _],
    [#if star and use-stars { emoji-svg("star")}
      *#name* #if url != none [(#url)]\
       _#descr _ ],
  )
  #v(entry-sep)
]



// Header
#box(height: 4cm)[
  #grid(
    columns: (auto, 1fr, auto),
    inset: (0cm, 0.5cm, 0cm),
    align: (left + top, right + bottom, left),
    // stroke: black
  )[
    #v(0.5cm)
    #text(size: 20pt)[*Diego DORN*]\
    #text(size: 16pt)[Research Engineer]\
    #v(1fr)
    #emoji-svg("enveloppe")
      #link("mailto:cv@ddorn.fr")[`cv@ddorn.fr`]\
    #emoji-svg("internet")
      #link("https://ddorn.fr")[`ddorn.fr`]\
    #emoji-svg("github")
      #link("https://github.com/ddorn")[`github.com/ddorn`]
    #v(0.5cm)
  ][ #box(width: 82%, height: 100%)[  // You can tweak this number% for the width of the description text so that it looks best
    #show strong: txt => [#text(fill: accent-strong)[#txt]]  // Color the bold text
    A self-taught *research engineer* with 90+ public repositories on GitHub
    who likes
    to work with humans,
    learn,
    and create good tools
    that are actually useful for others.

    His last projects where on the mitigation of *systemic risks* from *general-purpose artificial intelligence* systems
    (research, engineering, teaching)
  ] //#h(-0.5cm)
][
    // #image("images/photo.JPG")
  ]
]

#v(-0.4cm)
= Work Experience
#entry([Research engineer at CeSIA (French Center for AI safety)],
  [Lead the design of benchmarks to evaluate jailbreak and hallucination detectors for LLMs, red-teamed input-output safeguards.
  Published "#link(
    "https://arxiv.org/abs/2406.01364",
  )[ #emph[BELLS: A Framework Towards Future Proof Benchmarks for the Evaluation of LLM Safeguards]]" in the NextGen AI Safety workshop at ICML 2024.
  ],
  [Feb. -- Aug. 2024 ],
  Paris,
  star: true
)

#entry([Head Teacher for four ML4Good, a summer school on systemic AI risk],
  [Delivery and improvement of 10 days of technical and conceptual workshopsw for \~20 participants, covering threat modeling, technical safety and AI policy. Management of the teaching team of 2\~3.],
  [Aug. 2023 -- present],
  Europe,
  url: [#link("https://www.ml4good.org")[`ml4good.org`]],
  star: true
)


#entry([Research assistant, Machine Learning Group, Cambridge University],
  [Research on goal misgeneralisation in Reinforcement Learning (RL) with N. Alex and D. Krueger.
  //#emoji-svg("page")
  Published "#link(
    "https://openreview.net/forum?id=QT4tXTqTTr",
  )[ #emph[Goal Misgeneralization as Implicit Goal Conditioning]]" in the GCRL workshop at Neurips 2023
],
  [July -- Sep. 2023],
  Cambridge)

#entry([Lead developer for the startup SPRIG],
  [Developing a distributed platform to increase confidence in mathematical proofs.],
  [Jan. 22 -- May 23],
  Lausanne,
  url: [#link("https://sprigproofs.org")[`sprigproofs.org`]]
)

// #entry([Teaching assistant at EPFL],
//   [TA for 8 courses for 1st, 2nd and 3rd year bachelors: Analysis (real, vectorial, complex), C++, mathematical logic, computer science basics.],
//   [2019 - 2021],
//   Lausanne)

= Education

#entry([Master's in Communication Systems, Ecole Polytechnique Fédérale de Lausanne (EPFL)],
  [Focus on artificial intelligence, formal verification and advanced algorithms. Minor in Mathematics. Obtained with an average of 5.59/6 and the maximum grade for the master thesis.],
  [Sep. 21 -- Aug. 2024],
  Lausanne)

#entry([Summer school "Science and Policy – How to bridge the gap?"],
  [5 days on science for policy, science communication, open science and the Swiss policy landscape.],
  [July 2023],
  loc([Interlaken], "CH"),
  // star: true
)

#entry([ARENA, Alignment Research Engineer Accelerator],
  [6 weeks intensive training on interpretability, RL and training at scale.],
  [May -- June 2023],
  London,
  url: [#link("https://arena.education/")[`arena.education`]],
  // star: true,
)

// #entry([Semester research projects in Mathematical Logic and Game Theory],
//   [Guided research under Jacques Duparc's supervision\
//    #emoji-svg("page") "#link(
//       "https://gitlab.com/ddorn/ba6/-/jobs/artifacts/master/raw/projet/projet.pdf?job=pdf",
//     )[ #emph[Infinite games in the Baire space] ]", Bachelor thesis, Spring 2021\
//    #emoji-svg("page") "#link(
//       "https://github.com/ddorn/safra/blob/master/out/projet.pdf",
//     )[ #emph[Between decidable logics: $omega$-automata and infinite games]]", Master’s semester project, Spring 2022
// ],
//   [2021 -- 2022],
//   Lausanne)

#entry([Bachelor's in Mathematics at EPFL],
  [Passed with a 5.42/6 average and top 5/100 of my year.],
  [Sep. 18 -- July 2021],
  Lausanne)





= Volunteering
#entry([Founder and President of the Safe AI Lausanne student association],
  [Led a team of 8 through the design of a strategy, resulting in a 10-day
  winter school on systemic AI risks, 3 talks and 2 panel discussions with a
  total of 10 experts, and giving a talk for TEDxEcublens.
],
  [Sep. 22 -- March 24],
  Lausanne,
  star: true
)

// #entry([Vice-president, then advisor for Effective Altruism Lausanne],
//   [Association aiming to find the best ways to help others and put them into practice],
//   [2022 -- 2023],
//   Lausanne)

// #entry([Co-founder of Chocopoly, the hot chocolate association of EPFL],
//   [Established 19 collaborations with other associations and served 1288L of hot chocolate.],
//   [2021 -- 2023],
//   Lausanne)

#entry([President of CQFD, the mathematics students' association of EPFL],
  [Management of a team of 14 people, dialogue with the direction of the faculty.],
  [Sep. 20 -- Sep. 21],
  Lausanne)

// #entry([National organisation committee of the french tournament of young mathematicians, TFJM#super("2")],
// [Coordination of 9 events for 600 participants, communication, and creation of a new  online infrastructure.],
//   [Sep. 20 -- May 21],
//   loc([Many places], "FR"))

= Awards & Extra

#entry([1st place in the hackathon the "Digital Services Act RAG Race"],
  [Creation of a Q&A system for questions on the DSA based on open-source models, in a team of 3, during a 7 hours hackathon organised by the PEReN and the European Commission.],
  [February 2024],
  Bruxelles,
  star: true
)

#entry([Game development, tool design, websites],
  [Creation of 10+ small games under strong time constraints and pressure for game jams, a 2D EsoLang (#link("https://github.com/aaronjanse/asciidots")[Asciidots]), multiple software tools and websites.
  Teamwork and sprints.
],
  [2014 -- present],
  [#loc("Earth", "earth")],
  url: [#link("https://ddorn.fr/showcase")[`ddorn.fr/showcase`]]
)


#let skill(name, time, details: none) = [
  *#name*
  #if details != none [(#details)]
  #box(width: 1fr,
    // stroke: (bottom: accent-strong + 0.5pt)
    text(fill: accent-strong, repeat([.]))
  )
  _#time _\
]

#v(0.2cm)
#grid(columns: (3fr, 2fr), gutter: 0.5cm)[
= Hard Skills
#skill([#if use-stars {emoji-svg("star")} Python], [6000h], details: [pytorch, huggingface, streamlit, click, mypy, pytest…])
#skill([JavaScript / CSS / HTML], [500h], details: [VueJS, TailwindCSS])
#skill([Rust, C++, Scala, LaTeX], [300h each])
#skill([System Administration], [200h], details: [Git, Docker, Bash, remote machines...])


][
= Soft Skills
  - Training in Non-Violent Communication
  - Public speaking
  - Native in French (C2)
  - Fluent in English (C1)
]


#show: ""

- *Programming* Main hobby for the 10 last years. Many projects can be seen at
        #link("https://ddorn.fr/showcase")[`ddorn.fr/showcase`]

  - *Python (6000h)* ~~ Some of the modules I enjoyed using in more than 2 projects each include:
    #{
      let modules = "asyncio, click, einops, fastAPI, flask, jaxtyping, joblib, huggingface, kivy, matplotlib, moderngl, mypy, numba, numpy, pillow, plotly, poetry, pre-commit, pygame, pytest, pytorch, stable_baselines3, streamlit, transformer_lens, typeguard, typer".split(", ").sorted()
      for name in modules [
        #raw(name),
      ]
    }

  - *Rust (300h)*, #strong[Scala (200h)] and #strong[C/C++ (300h)]

  - *JavaScript / CSS / HTML (500h)* ~~ Also using, VueJS, TailwindCSS, typescript
  - *Other languages* ~~ LaTeX (200h), Typst, 6502/NES assembly, Haskell, Matlab, Lean

  - *Tools* ~~ Vim, Jetbrains IDEs, VS Code, git, Docker, slurm, runAI, inkscape, OBS, Google Suite, ArchLinux (i3wm/sway)…

- *Soft skills:* Non-violent communication
- #strong[Languages:] French (native), English (fluent)//, Italian & German (basics, willing to learn more)
