We need to identify the best practices on how to build a successful open source community around our project. In order to do this we will research about how successfully existing open source communities work.

# Best Practices

## Tech

From a technical side, although all we need to make a previously closed source project open source is to put the source code online, it is highly recommended to check a couple of things before jumping and publishing our project:

- **Check if our project is able to be open source**. This means that any libraries we use must be under a compatible license.

- **Choose an open source license**. It is easy to publish something under a free license, but you can not un-publish it after or at least it could be counterproductive for our reputation.

- **Also check if our software is usable without any closed source applications**. Sometimes software depends on 3rd party components. If this is the case for our application, we have to make sure these components are also available under open source licenses or make sure that the software is either compatible with open source alternatives or is usable without them.

- **In case we held any software patents which apply to our project**, we should release a statement that we will not use our patent to prohibit the development and distribution of the program or derivatives.

- **Allow developers to easily start working on the project**. Provide clear instructions how to checkout the code, compile, configure and deploy it. Try to avoid requiring custom tools or a very complicated toolchain to build the software from source. Make sure that we provide everything that is needed to compile the project. Basic project set-up instructions could be included in the very first version of a README file.

- **Try to solve worse possible vulnerabilities**. As the sourcecode will be available, it becomes easier for others to find vulnerabilities, and at the same time easier for others to provide patches, but it can take time. We also should be sure to remove any corporate secrets from the codebase, like passwords, cryptographic keys or similar, following the _Kerckhoffs's_ principle: “A (crypto)system should be secure even if everything about the system, except the key, is public knowledge.”.

In addition to this, and taking the suggestions of _Gregorio Robles_ based on _Eric S. Raymond’s_ essay _The Cathedral and the Bazaar_, software developed using the _bazaar model_ (in which the code is developed over the Internet in view of the public) should exhibit the following patterns:

- **Users should be treated as co-developers**. The users are treated like co-developers and so they should have access to the source code of the software. Furthermore, users are encouraged to submit additions to the software, code fixes for the software, bug reports, documentation, etc. Having more co-developers increases the rate at which the software evolves. Linus's law states, "Given enough eyeballs all bugs are shallow." This means that if many users view the source code, they will eventually find all bugs and suggest how to fix them. Note that some users have advanced programming skills, and furthermore, each user's machine provides an additional testing environment. This new testing environment offers the ability to find and fix a new bug.

- **Early releases**. The first version of the software should be released as early as possible so as to increase one's chances of finding co-developers early.

- **Frequent integration**. Code changes should be integrated (merged into a shared code base) as often as possible so as to avoid the overhead of fixing a large number of bugs at the end of the project life cycle. Some open-source projects have nightly builds where integration is done automatically on a daily basis.

- **Several versions**. There should be at least two versions of the software. There should be a buggier version with more features and a more stable version with fewer features. The buggy version (also called the development version) is for users who want the immediate use of the latest features, and are willing to accept the risk of using code that is not yet thoroughly tested. The users can then act as co-developers, reporting bugs and providing bug fixes.

- **High modularization**. The general structure of the software should be modular allowing for parallel development on independent components.

- **Dynamic decision-making structure**. There is a need for a decision-making structure, whether formal or informal, that makes strategic decisions depending on changing user requirements and other factors.

## People

Although software development is an important part of the project success, the fundamental part to build a healthy community is people. We have to think not only in ways to attract talent but also on how to motivate them to participate, contribute and feel part of the project. Everything is around people. Our open-source community will be more willing to contribute to our project if they feel a sense of inclusiveness, and beyond this, if we can give them a sense of ownership of the project.

In order to to this we need to provide them some infrastructure:

- **Offer communication platforms for our community** to discuss the development of the project. This could be done in several ways:
  - Email list.
  - Google Group.
  - GitHub page. 
  - Discord.  
  - Twitter.
  - Forums.
  - Blog.

- **Create spaces to meet**. We could organise/collaborate/participate in industry related events:
  - Meetups.
  - Conferences.
  - Workshops.
  - Hackathons. 
  - Contests.

- **Have people available to manage and moderate** our communication channels and community contribution processes. In the future we might want to outsource this to trusted community members, but in the meantime we will need to handle this on our own. It is extremely important that those members in charge have good people and communications skills, and it is also absolutely critical that they are able to recognise good ideas from others.

- **Always be welcoming, polite, and respectful**; this will show our goodwill toward people.

- **Keep in mind that contributors could come from all around the world** with different cultures, origins, and native languages, and their English might not be perfect. Stay open and tolerant. In general, our open source community needs to offer a harassment-free experience for all users, regardless of their age, ethnicity, gender, nationality, sexual identity, or religion.

- **Promote alternative and varied ways to contribute**. Do not forget that there are many different ways to contribute to an open source project, not only coding:
  - Using and spreading the word about our project.
  - Organising events (e.g., meetups, conventions)
  - Designing (e.g., mock-ups, specs)
  - Writing (e.g., documentation, tutorials, video tutorials, blogs)
  - Gardening (e.g., sorting issues and pull requests, moderating the forum)
  - Helping on the forum, chat, or other communication channels.

To sum up, understanding the reasons why people contribute to our project will help us understand our community and our users. We have to try to meet them in real life at events and meetups, chat with them on social networks, and just ask them why they are participating.

## Documentation

**Good documentation is a mark of seriousness**. If it is not available, people will look for another project. Just like good code, proper documentation is difficult and time consuming to write. In fact, according to GitHub, 93% of people consider incomplete or outdated documentation to be a major problem.

**We have to make sure that all our processes are kept transparent for potential contributors**: To do so, we will be sure to:

- Update the documentation regularly.
- Write it in a way that is easy to contribute to.
- Label it appropriately so that it will be easy for newbies to scan on the issues and get started. For example, create files like “for newbies”, “small bugs to resolve”, or “improve documentation”.

In our docs, we must include at least:
- A description of the project, what it does, what it does not do (if needed), the current roadmap, and the distribution license
- How to install and a list of prerequisites
- Basic instructions for end users
- Basic instructions for maintainers (run, updates, monitor, etc.)
- How to build from source
- How to contribute
- How to write code (the expected standards per language)
- How to write and run tests
- A list of dependencies and their licenses
- A list of all the software's extension systems and how to use them with examples (e.g., modules, themes, hooks, APIs, etc.)
- Links to tutorials and interesting technical content on other websites
- Ways to contribute to the project other than code

Lastly, **do not forget to make people who land on our open source project feel welcome**. Thank them for their interest in our open source project, using clear and accessible language. A few words of kindness can prevent someone from leaving our project.

Below you can see some examples of successfully OS projects/products/communities

|                                                        | Contributors | Stars | Forks | Updated (Feb. 8th, 2021) | Notes                                                                                                                                                                                                                                                      |
|--------------------------------------------------------|--------------|-------|-------|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Rails](https://github.com/rails/rails)                | 4166         | 47.5k | 19.1k | Less than 12 hours ago   | They were able to build their community through events like [RailsConf](http://railsconf.com/).                                                                                                                                                            |
| [React](https://github.com/facebook/react)             | 1531         | 163k  | 32.7k | Less than 2 days ago     | Provide issue templates on GitHub to get better documentation.                                                                                                                                                                                             |
| [Node](https://github.com/nodejs/node)                 | 2929         | 76.8k | 19.3k | Less than 12 hours ago   | Include in GitHub a label "code-and-learn" for issues related to events (e.g. PRs submitted during the events). Also has "good first issue" and "help wanted" labels to invite participation.                                                              |
| [Tensorflow](https://github.com/tensorflow/tensorflow) | 2883         | 153k  | 84k   | Less than 1 hour ago     | Include in GitHub issue templates to make easier to start participating.                                                                                                                                                                                   |
| [Swift](https://github.com/apple/swift)                | 853          | 55k   | 8.8k  | Less than 1 hour ago     | As our tool is built on top of this language it could be interesting to be near this community. Apart from the [official](https://forums.swift.org/) there're communities like [hackingwithswift](https://www.hackingwithswift.com/) with their own forum. |
| [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)        | 1803         | 123k  | 21.5k | 9 days ago               | Very detailed README file                                                                                                                                                                                                                                  |
| [Linux](https://github.com/torvalds/linux/)            | 11246        | 105k  | 35.7k | Less than 1 day ago      |                                                                                                                                                                                                                                                            |

# Sources
- [What are the main steps to convert a currently closed source project into an open source one?](https://opensource.stackexchange.com/questions/589/what-are-the-main-steps-to-convert-a-currently-closed-source-project-into-an-ope) 
- [The Cathedral and the Bazaar, by Eric S. Raymond](http://www.catb.org/~esr/writings/cathedral-bazaar/) 
- [A Software Engineering Approach to Libre Software, by Gregorio Robles](http://www.opensourcejahrbuch.de/download/jb2004/chapter_03/III-3-Robles.pdf)
- [Building Welcoming Communities](https://opensource.guide/building-community/)
- [How to Build a Vibrant Open-Source Community in 5 Steps](https://adevait.com/blog/workplace/build-open-source-community)
- [Open Source Survey](https://opensourcesurvey.org/2017/)
- [The shape of open source](https://github.blog/2016-06-23-the-shape-of-open-source/)
- [10 tips for managing an open source community](https://opensource.com/article/19/5/tips-managing-community)
- [The Open Source Contributor Funnel (or: Why People Don’t Contribute To Your Open Source Project)](https://mikemcquaid.com/2018/08/14/the-open-source-contributor-funnel-why-people-dont-contribute-to-your-open-source-project/)