---
title: "[Notes] Natural Language Processing"
author: harshityadav95
date: 2020-02-17 00:00:00 +0530
categories: [AI ML]
tags: [nlp, machine-learning, notes]
---

## [Notes] Natural Language Processing

- **Lexical**: relating to the words or vocabulary of a language
- **Pragmatic**Analysis is part of the**process**of extracting information from text
- **Lexical semantics:**knowledge of the meanings of the component words
- **Compositional semantics**: knowledge of how these components combine to form larger meanings
- **Syntax**: the knowledge needed to order and group words together
- **Morphological parsing**, in natural language processing, is the process of determining the**morphemes**from which a given word is constructed
- **discourse conventions:**knowledge of correctly structuring these such conversations
- **Phonology **— concerns how words are related to the sounds that realize them.
- **Morphology** — concerns how words are constructed from more basic meaning units called morphemes. A morpheme is the primitive unit of meaning in a language.
- **Syntax **— concerns how words can be put together to form correct sentences and determines what structural role each word plays in the sentence and what phrases are sub-parts of other phrases.
- **Semantics **— concerns what words mean and how these meaning combine in sentences to form sentence meaning. The study of context-independent meaning.
- **Nominalization :**A very common kind of derivation in English is the formation of new nouns, often from verbs or adjectives
- **Concatenative morphology :**The kind of morphology in which a word is composed of a string of morphemes concatenated together
- **Non-concatenative morphology :**

Ex: the suffix -ation produces nouns from verbs ending often in the suffix -ize**(computerize → computerization).**

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-79305b733032.png)

In 1952 : First voice Recognition system to recognise words

**Speech recognition**

- Spoken language is recognized and transformed in into text as in dictation systems, into commands as in robot control systems, or into some other internal representation.

**Speech synthesis**

- Utterances in spoken language are produced from text (text-to-speech systems) or from internal representations of words or sentences (concept-to-speech systems)

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-6a1ded9d7c75.png)

## **Word Sense Disambiguation (WSD)**

Words in natural language usually have a fair number of different possible meanings.For many tasks (question answering, translation), the proper sense of each ambiguous word in a sentence must be determined

- Ellen has a strong**interest**in computational linguistics.
- Ellen pays a large amount of**interest**on her credit card

## **Ways to resolve or disambiguate these ambiguities:**

- Deciding whether duck is a verb or a noun can be solved by**part-of-speech tagging .**
- Deciding whether make means “create” or “cook” can be solved by**word sense disambiguation**.
- Resolution of part-of-speech and word sense ambiguities are two important kinds of**lexical disambiguation**.

**Natural Languages vs. Computer Languages**

- Ambiguity is the primary difference between natural and computer languages.
- Formal programming languages are designed to be unambiguous, i.e. they can be defined by a grammar that produces a unique parse for each sentence in the language.

## **Models and Algorithms**

- state machines
- formal rule systems,
- logic,
- probability theory (weighted automata, Markov models, and hidden Markov models, which have a probabilistic component)
- other machine learning tool

**The most important algorithms of these models:**

- state space search algorithms
- dynamic programming algorithms

Among the algorithms that are often used for these tasks are well-known graph algorithms such as depth-first search, as well as heuristic variants such as best-first, and A* search

**Parsing vs. Morphological parsing**

- **Parsing:**taking an input and producing some sort of linguistic structure for it.
- **Morphological parsing:**The problem of recognizing that a word (like foxes) breaks down into component morphemes (fox and -es) and building a structured representation of this fact is called morphological parsing.
- **Stemming**: Just stripping off such word endings is called stemming
- **Lemmatization :**For example the words sang, sung, and sings are all forms of the verb sing ,The word sing is called the common lemma of these words, and mapping from all of these to sing is called lemmatization
- **Morphology**is the study of the way words are built up from smaller meaning-bearing units, morphemes
- **Tokenization or word segmentation**is the task of separating out (tokenizing) words from running text

A common way of doing this is with the**minimum edit distance algorithm,**which is important throughout NLP.

Affixes = Prefix, infixes, suffixes

## Grammar Revision:

**There are many ways to combine morphemes to create words**

- inflection,
- derivation,
- compounding
- cliticization

## **1. Inflection**

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-8492ba7b7030.png)

is the combination of a word stem with a grammatical morpheme, usually resulting in a word of the same class as the original stem, and usually filling some syntactic function like agreement.

Ex: English has the inflectional morpheme -s for marking the plural on nouns, and the inflectional morpheme -ed for marking the past tense on verbs.

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-8492ba7b7030.png)

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-de0ce30401c5.jpg)

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-11195993f089.png)

- Irregular verbs constitutes a smaller class of verbs there are only about 250 irregular verbs

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-9af1a912a5cc.png)

## **2.Derivation**

is the combination of a word stem with a grammatical morpheme, usually resulting in a word of a different class, often with a meaning hard to predict exactly.For example the verb c**omputerize**can take the derivational suffix -ation to produce the noun**computerization**

## **3 .Compounding**

is the combination of mul-tiple word stems together.For example the noun doghouse is the concatenation of the morpheme dog with the morpheme house. Ex: baseball, desktop, homework

## **4 .Cliticization**

is the combination of a word stem with a clitic.A clitic is a morpheme that acts syntactically like a word, but is reduced in form and attached (phonologically and sometimes orthographically) to another word.

For example the English morpheme ‘ve in the word I’ve is a clitic, as is the French definite article l’ in the word l’opera.

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-017cdf607d8b.png)

## **Summary: Inflection vs. Derivation**

- books and book are different grammatical forms of the same morpheme
- A derivational suffix like “-ly”can transform an adjective into an adverb, the suffix “-ment” is often used to produce a noun.

1. **Any prefixes in the English language are derivational,**very few of them change the part of speech of the stem.
2. Affixes which do not change the part of speech of the base are usually (though not invariably)**inflectional**.
3. Inflectional affixes always have a regular meaning. Derivational affixes may have irregular meaning

## **FINITE-STATE MORPHOLOGICAL PARSING**

- Input forms: to take input forms like those in the first column
- Output forms: like those in the second column

![Medium article image](/assets/img/posts/notes-natural-language-processing/medium-image-a9fb41b5021f.png)

Ex: feature +N means that the word is a noun ,+SG means it is singular ,PL that it is plural.

sc

Reference Slides:

- [https://www.slideshare.net/HarshitYadav3/l1-nlp-intro](https://www.slideshare.net/HarshitYadav3/l1-nlp-intro)

## Reference

- [Original Medium article](https://medium.com/@harshityadav95/notes-natural-language-processing-3027820ea347)
