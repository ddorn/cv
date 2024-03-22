#set page(margin: (x: 0.5cm, top: 0.0cm, bottom: 0.5cm))

#let accent = rgb("faf5f0")
#let side = 3cm
#show heading.where(level: 1): it => {
  v(-0.3cm)
  rect(
    // radius: 1pt,
    fill: accent,
    stroke: (bottom: black),
  )[#smallcaps[#it.body] #h(1fr)]
}
#show link: it => underline(it, stroke: rgb("d0bab0"))

// Emojis taken from https://github.com/ariabuckles/twemoji-svg/tree/master/assets/svg
// Unicode point can be looked up https://www.emojiall.com/en/code/1F4C4
#let emoji-svg(name, is-flag: false) = [
  #let base = if is-flag { 0em } else { 0.2em }
  #let height = if is-flag { 0.66em } else { 1em }
  #box(baseline: base)[#image("images/" + name + ".svg", height: height)]
]

#show ", UK": emoji-svg("uk", is-flag: true)
#show ", FR": emoji-svg("fr", is-flag: true)
#show ", DE": emoji-svg("de", is-flag: true)
#show ", CH": emoji-svg("ch", is-flag: true)
#show "📄": emoji-svg("page")

#let entry(name, descr, dates, loc, url: none) = [
    #grid(columns: (side, auto), 
    gutter: 0.6cm,
    // inset: (x: 0.3cm),
    align: (right, left),
      [#box[#align(right)[#loc\ _#dates _]] ],
      [*#name* #if url != none [(#url)]
      \  _#descr _ ],
    )
]

#box(height: 3.3cm)[
  #grid(columns: (auto, 1fr, auto), inset: (0cm, 0.5cm, 0cm), align: (horizon, right + bottom, left))[
    #text(size: 20pt)[*Diego DORN*]\
    #emoji-svg("enveloppe") 
      #link("mailto:cv@ddorn.fr")[`cv@ddorn.fr`]\
    #emoji-svg("internet") 
      #link("https://cozyfractal.com")[`cozyfractal.com`]\
    #emoji-svg("github")
      #link("https://github.com/ddorn")[`github.com/ddorn`]
    ][ #box(width: 90%)[
    Diego finishes his master in August 2024, with \~1 year of professional expertise 
    in *software engineering* and *teaching*, especially in the
    measurement and mitigation of *risks* from 
    *artificial intelligence* systems.
    ]
  ][
    #image("images/photo.JPG", height: 3.5cm)
  ]
]

#v(-0.4cm)
= Work Experience
#entry([Research engineer at EffiSciences],
  [Automated supervision of LLM-agents, design of a benchmark to evaluate detection of out-of-distribution failure modes by monitoring systems.], 
  [Feb. 2024 -- present],
  [Paris, FR])
  
#entry([Research assistant, Machine Learning Group, Cambridge University],
  [Research on goal misgeneralisation with N. Alex and D. Krueger\
  📄 "#link(
    "https://openreview.net/forum?id=QT4tXTqTTr",
  )[ #emph[Goal Misgeneralization as Implicit Goal Conditioning]]" in the GCRL workshop at Neurips 2023
],
  [July -- Sep. 2023],
  [Cambridge, UK])
  
#entry([Teacher at ML4Good, a summer school on AI safety],
  [Delivery and improvement of 10 days of technical and conceptual content. 21 participants],
  [August 2023],
  [Berlin, DE])
  
#entry([Lead developer for SPRIG],
  [Developing a distributed platform to increase confidence in mathematical proofs],
  [2022 -- 2023],
  [Lausanne, CH],
  url: [#link("https://sprigproofs.org")[`sprigproofs.org`]]
)
#entry([Teaching assistant at EPFL],
  [TA for 8 courses for 1st, 2nd and 3rd year bachelors: Analysis (real, vectorial, complex), C++, mathematical logic, computer science basics],
  [2019 - 2021],
  [Lausanne, CH])

#entry([Game development & small projects],
  [Creation of 10+ small games under strong time constraints for jams, a 2D EsoLang (#link("https://github.com/aaronjanse/asciidots")[Asciidots])...],
  [],
  [],
  url: [#link("https://cozyfractal.com/showcase")[`cozyfractal.com/showcase`]]
)
  
= Volunteering
#entry([Founder of the Safe AI Lausanne student association],
  [ Events on reducing systemic and catastrophic risks from AI. Organisation of a 10-day bootcamp, talks and a reading group. Moderation of two round table discussions.
],
  [2022 -- 2024],
  [Lausanne, CH])
  
#entry([Vice-president, then advisor for Effective Altruism Lausanne],
  [Association aiming to find the best ways to help others and put them into practice],
  [2022 -- 2023],
  [Lausanne, CH])
  
#entry([Co-founder of Chocopoly, the hot chocolate association of EPFL],
  [Followed by 400+ students, collaborated with 19 associations and served 1288L of hot chocolate],
  [2021 -- 2023],
  [Lausanne, CH])
  
#entry([President of CQFD],
  [The association of mathematics students of EPFL],
  [2020 -- 2021],
  [Lausanne, CH])
  
#entry([Member of the national organisation committee of the TFJM#super("2")],
  [The french tournament of young mathematicians. Coordination of 9 events across France, development of a new online infrastructure and communication],
  [2020 -- 2021],
  [Many places, FR])

= Education

#entry([Master's at EPFL in Communication Systems, minor in Mathematics],
  [Focus on artificial intelligence, formal verification and complexity theory],
  [2021 -- present],
  [Lausanne, CH])
  
#entry([Summer school "Science and Policy – How to bridge the gap?"],
  [Topics: science for policy, science communication, open science, Swiss policy landscape],
  [July 2023],
  [Interlaken, CH])
  
#entry([ARENA, Alignment Research Engineer Accelerator],
  [6 weeks intensive training on interpretability, RL and training at scale],
  [May -- June 2023],
  [London, UK], 
  // url: [#link("https://arena.education/")[`arena.education`]]
)

#entry([Semester projects in Mathematical Logic and Game Theory],
  [Guided research under Jacques Duparc's supervision\
   📄 "#link(
      "https://gitlab.com/ddorn/ba6/-/jobs/artifacts/master/raw/projet/projet.pdf?job=pdf",
    )[ #emph[Infinite games in the Baire space] ]", Bachelor thesis, Spring 2021\
   📄 "#link(
      "https://github.com/ddorn/safra/blob/master/out/projet.pdf",
    )[ #emph[Between decidable logics: $omega$-automata and infinite games]]", Master’s semester project, Spring 2022
],
  [2021 -- 2022],
  [Lausanne, CH])
  
#entry([Bachelor's in Mathematics at EPFL],
  [Passed with a 5.42/6 average and top 5/100 of my year.],
  [2018 -- 2021],
  [Lausanne, CH])


#pagebreak()
#set page(margin: (y: 1cm, x: 0.5cm))


= Skills

- *Programming* Main hobby for the 10 last years. Many projects can be seen at
        #link("https://cozyfractal.com/showcase")[`cozyfractal.com/showcase`]
  - #strong[Python (6000h)] ~~ Some of the modules I enjoyed using in more than 2 projects each include: asyncio, click, einops, fastAPI, flask, jaxtyping, joblib, huggingface, kivy, matplotlib, moderngl, mypy, numba, numpy, pillow, plotly, poetry, pre-commit pygame, pytest, pytorch, stable_baselines3, streamlit, transformer\_lens, typeguard
  
  - #strong[Rust (300h)], #strong[Scala (200h)] and #strong[C/C++ (300h)]

  - #strong[JavaScript / CSS / HTML (500h)] ~~ Also using, VueJS, TailwindCSS, typescript

  - #strong[Other languages] ~~ LaTeX (200h), Typst, 6502/NES assembly, Haskell, Matlab, Lean

  - #strong[Tools] ~~ Vim, Jetbrains IDEs, VS Code, git, Docker, slurm, runAI, inkscape, OBS, Google Suite, ArchLinux (i3wm/sway)…
  
- *Collaboration:* Non-violent communication
- #strong[Languages:] French (native), English (fluent), Italian & German (basics, willing to learn more)
