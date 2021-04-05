We need to decide how we want to rule the interactions on the project. In order to do so, we will research about different types of governance models and the possibilities they offer.

# Choose an governance model

## What is a governance model

Generally speaking the term "governance" can refer to a system of rules, roles, and procedures that determine how power in an organization gets distributed. It is about defining and managing **"The rules or customs that determine who gets to do what (or is supposed to do what), how they're supposed to do it, and when."**. In the case of Open Source project and Community Governance **is all about people**, their **rights** and **responsibilities** as part of a project **and** the **expectations** others have for them.

When analyzing your own governance systems, ask the following questions:

- What roles do (or can) project contributors play?
- What qualifies a person to play a particular role in the project?
- What duties, privileges, and forms of authority are associated with each role?
- What project resources are the province or responsibility of people who perform certain roles?
- How do various contributions get accepted into the project?
- How do contributors come to occupy and eventually depart from certain roles in the project?
- How can role descriptions and responsibilities be changed?
- How do project decisions get made (and by whom)?
- How are debates and conflicts resolved (and by whom)?

Because **Open Source projects are organizations, every one features governance structures**. Some of these structures are more explicit than others. Some are more formal than others. But every project has them.

## Why governance model is important?

Although the idea of "governance" could have a poor reputation in some Open Source communities (sometimes viewed as a set of rules or procedures aimed solely at telling people what they can't do, how they shouldn't act, or how they should limit themselves to acting only within certain boundaries), a clear and **well-crafted governance model** can in fact be a largely positive force, **encouraging new contributors to become involved in your project**, and is much less likely to turn away or de-motivate project participants than a vague or non-existent one is.

So a community's goal in architecting a governance model should be, **"Make structures of participation obvious."** When your project's rules are clear, contributors can engage with confidence. Taking this approach to governance can positively impact a project's long-term sustainability and growth.

Even more, **a good governance model will actually increase the agility of the project**, as it defines how new contributors can take the project in unexpected directions without interfering with its core goals. It provides a mechanism for **allowing the community as a whole to define the direction they feel the project should take**, while ensuring that the core project team does not lose control.

No matter how an Open Source project is structured. It is **always necessary to define some mechanism for deciding how to make technical decisions**. Someone, or some group, has to decide which commits to accept, which to reject, and more broadly what direction the project is going to take from a technical perspective.

Here's an example of how valuable could be providing information: **in 2018, the Kubernetes project Release Team added a set of detailed, comprehensive Role Handbooks**, outlining information related to the Release Team role, including qualifications necessary for joining them, duties members of the team perform, and details on the team's decision-making processes. **As a result, the Release Team became the most popular point of entry for project contributions**, mainly because potential participants knew exactly what to do and expect. After that other teams at Kubernetes followed suit and experienced a doubling or even tripling of the number of new contributors.

## Types of governance models

There are many ways to rule an Open Source project, but regardless of which one is chosen, a **governance model should make the process of making and evaluating third party contributions easier, not harder**. It should remove the uncertainty that can lead to wasted time for everyone involved.

It is interesting to note that **not all Open Source is truly open**. Many Open Source projects are run by a single individual or controlled by a single vendor, and are quite closed in their governance. Other projects are welcoming of outside contributions, but are not open to outside contributors owning leadership roles that let them set technical strategy and direction.

**Governance models range from centralised control** by a single individual or organisation (benevolent dictatorship) **to distributed control** awarded in recognition of contributions (democray). **You can find governance models at any point along this spectrum**. In fact, much more commonly, projects' governance models evolve and move along this spectrum as their communities grow and diversify.

### Founder-leader (aka "BDFLs" or "Benevolent Dictators for Life")

The founder-leader governance model is most **common among new projects or those with a small number of contributors** (and since most Open Source projects have only a small number of contributors, this is a rather popular model!) In these projects, the individual or group **who started the project also administers the project**, establishes its vision and roadmap, controls all permissions to merge code into it, and assumes the right to speak for it in public. Some projects refer to their founder-leaders as "BDFLs" or "Benevolent Dictators for Life," a term that is falling out of fashion.

Although "Benevolent Dictator" may sound intimidating at first, it would be better to think of it as "community-approved arbitrator" or "coordinator". Generally, benevolent dictators do not actually make all the decisions, or even most of the decisions. It's unlikely that one person could have enough expertise to make consistently good decisions across all areas of the project, and anyway, quality developers won't stay around unless they have some influence on the project's direction. Therefore, **benevolent dictators commonly do not dictate much**. Instead, they let things work themselves out through discussion and experimentation whenever possible. **Only when it is clear that no consensus can be reached**, and that most of the group wants someone to guide the decision so that development can move on, does she put her foot down and **say "This is the way it's going to be"**.

### Consensus-based Democracy

**As projects get older, they tend to move away from the benevolent dictatorship model and toward more openly democratic systems**, as "Do-ocracy" or "Meritocracy" (although this term carries negative connotations for some communities and has a complex social and political history).

Consensus simply means **an agreement that everyone is willing to live with**. It is not an ambiguous state: a group has reached consensus on a given question when someone proposes that consensus has been reached and no one contradicts the assertion.

The details of how these systems work vary widely, but there are two common elements:

- The group works by **consensus most of the time**.
- There is a **formal voting mechanism** to fall back on when consensus cannot be reached.

#### **Meritocracy. Power of those who have "merit"**

Democratic projects are normally **auto governing and driven by the people who volunteer** for the job. This is sometimes referred to as "meritocracy", and this functions well for most cases.

In addition, the meritocratic model tries to **give everyone a voice and reward those who make valuable contributions** by providing mechanisms for recognition, such as increased visibility within the project.

As with the benevolent dictator model, **decisions are made by listening to the community** and eventually taking action based on the consensus that emerges. However, in many cases there is no need for discussion, since the correct path is obvious. In this case, it is sufficient to simply state one's intentions and allow time for someone to object. In the absence of an objection, it is assumed that the community agrees with the proposed action. This is sometimes called **"lazy consensus"**. The effect of lazy consensus means that, **in practice, most decisions within a meritocracy are made in a way that is very similar to that of projects operating under a benevolent dictator model**. That is, once someone has earned the merit to allow them to define a course of action, the use of lazy consensus allows them to just go ahead and take whatever action they want. Just as a benevolent dictator could do.

Inevitably, some debates just won't consense. **When all other means of breaking a deadlock fail, the solution is to vote**. But before a vote can be taken, there must be a clear set of choices on the ballot.

It is important to note the **controversial of the term "merit"**, usually described as having the necessary ability or experience to do the job. However, meritocracies tend to promote those who not only have the skills/experience, but also the opportunity or possibility to let others know about it, priviledges that not everyone has to the same extent.

#### **Do-ocracy. Power of those who do**

Under a do-ocracy (sometimes called liberal contribution model), the people who do the most work are recognized as most influential, but in opposite to the previous model, this one is **based on current work and not historic contributions**. Again, **major project decisions are made based on a consensus seeking process rather than pure vote**, and strive to include as many community perspectives as possible.

That said it's interesting to note that **a particular governance style doesn't automatically imply a particular contribution model**, although projects do tend to start as cathedral-style (a small core of dedicated contributions) benevolent dictatorships and move towards bazaar-style (contributions from broad sources) contribution or meritocratic-style governance (or both) as they mature.

## How to organise the governance

When they reach a certain size, some open source projects under democratic models may appoint a number of **leadership groups to govern various aspects of a project**. Such groups may have names like "steering committee," "committer council," "technical operating committee, "architecture council," or "board of directors." And typically, these groups construct their own decision-making conventions and succession procedures.

In the same way some open source projects choose to conduct **governance through elections**. They may hold elections for various roles, or conduct similar electoral processes to ratify or update project policies and procedures. Under the electoral model, communities establish and document electoral procedures to which they all agree, then enact those procedures as a regular matter of decision-making.

Those models of governance tend to lead to precise documentation of project roles, procedures, and participation guidelines. When election documents make these matters explicit, they help new contributors maximize their involvement in a project.

## About Open Governance

It's important to point out that if users and contributors feel like they can't influence decisions about the future of the technology, projects have been known to fail or fork. **Open Governance is an effective strategy to attract developers** and IT industry players to a single Open Source project with the objective of attaining momentum faster. It looks to avoid community fragmentation and ensure the commitment of your contributors.

When a project is under Open Governance in an ecosystem of active developers, **the risk of the project being abandoned or not maintained at all is lower**. They can trust that their contributions will be accepted based on what they do and what's best for the project, not what's best for a particular company.

The reality is that open technology **projects managed under Open Governance** (the sort of Open Governance found in organizations such as Apache, Eclipse, Mozilla, and Linux) **are demonstrably more successful** (by an order of magnitude), **have a longer life, and are less risky** than projects that are controlled by a single vendor or are more restrictive in their governance.

## Some examples of governance through popular open source projects

### Apache Foundation projects

Apache foundation was created in 1999 by a group of people, that called themselves the "Apache Group" to continue to support and maintain the HTTPD web server written by the NCSA. **They self-organise around the basic principle of "meritocracy"**. When the group felt that the person had "earned" the merit to be part of the development community, they granted direct access to the code repository. **Their organization has various roles** within each individual Apache project communities:

- **User**. A user is someone that uses Apache software, contribute by providing feedback to developers, and participate by helping other users on mailing lists and user support forums.
- **Developer**. A developer is a user who contributes to a project in the form of code or documentation. Developers are also known as contributors.
- **Commiter**. A committer is a developer that was given write access to the code repository and has a signed Contributor License Agreement (CLA) on file.
- **PMC Member**. A PMC member is a developer or a committer that was elected due to merit for the evolution of the project and demonstration of commitment. They have write access to the code repository, the right to vote for the community-related decisions and the right to propose an active user for committership.
- **PMC Chair**. The Chair of a Project Management Committee (PMC) is appointed by the Board from the PMC Members. The PMC as a whole is the entity that controls and leads the project. The Chair is the interface between the Board and the Project. PMC Chairs have specific duties.
- **ASF member**. An ASF member is a person who was nominated by current members and elected due to merit for the evolution and progress of the foundation. Members care for the ASF itself. They have the right to elect the board, to stand as a candidate for the board election and to propose a committer for membership.

Regarding decision making, projects are normally auto governing and driven by the people who volunteer for the job. When coordination is required, **decisions are taken with a lazy consensus approach**: a few positive votes with no negative vote is enough to get going. The rules require that a negative vote includes an alternative proposal or a detailed explanation of the reasons for the negative vote.

### Python

Python programming language was conceived in the late 80s by Guido van Rossum, who shouldered sole responsibility for the project, as the lead developer, until 12 July 2018, when he [announced his "permanent vacation" from his responsibilities as Python's Benevolent Dictator For Life](https://mail.python.org/pipermail/python-committers/2018-July/005664.html). On that date he decided to remove himself entirely from the decision process, and delegate to the community the responsibility of taking decisions, starting with defining the way they wanted to take future decisions and define a new governance model.

They use the [PEPs]([Python Enhancement Proposals (PEPs)](https://www.python.org/dev/peps/)) formula to ask the community about the way they wanted to organise from that moment on, having different proposals:

- [The Technical Leader Governance Model -- PEP 8010](https://www.python.org/dev/peps/pep-8010/). This PEP proposes a **continuation of the singular technical project leader model**, euphemistically called the Benevolent Dictator For Life (BDFL) model of Python governance, to be henceforth called in this PEP the Gracious Umpire Influencing Decisions Officer (GUIDO).

- [Python Governance Model Lead by Trio of Pythonistas -- PEP 8011](https://www.python.org/dev/peps/pep-8011/). This PEP proposes a governance model for the Core Python development community, **led by a trio of equally authoritative leaders**. The Trio of Pythonistas (ToP, or simply Trio) is tasked with making final decisions for the language. It differs from PEP 8010 by specifically **not proposing a central singular leader, but instead a group of three people as the leaders**.

- [The Community Governance Model -- PEP 8012](https://www.python.org/dev/peps/pep-8012/) This PEP proposes a new model of Python governance **based on consensus and voting by the Python community**. This model relies on workgroups to carry out the governance of the Python language. This governance model works without the role of a centralized singular leader or a governing council.

- [The External Council Governance Model -- PEP 8013](https://www.python.org/dev/peps/pep-8013/) This PEP proposes a new model of Python governance based on a **Council of Auditors (CoA)** tasked with making final decisions for the language. It differs from PEP 8010 by specifically **not proposing a central singular leader**, and from PEP 8011 by **disallowing core committers from being council members**. It describes the size and role of the council, how the initial group of council members will be chosen, any term limits of the council members, and how successors will be elected.

- [The Commons Governance Model -- PEP 8014](https://www.python.org/dev/peps/pep-8014) This PEP proposes a governance **model with as few procedures, defined terms and percentages as possible**. It may also be called The **Anarchist Governance Model** but uses Commons for now because of possible negative connotations of the term Anarchist to some audiences.

- [Organization of the Python community -- PEP 8015](https://www.python.org/dev/peps/pep-8015/). This PEP **formalizes the current organization** of the Python community and proposes **3 main changes**: formalize the existing **concept of "Python teams"**; give **more autonomy to Python teams**; replace the BDFL (Guido van Rossum) with a **new "Python board"** of 3 members which has limited roles, mostly decide how a PEP is approved (or rejected).

- [The Steering Council Model -- PEP 8016](https://www.python.org/dev/peps/pep-8016/) This PEP proposes a model of Python governance based around a steering council. **The council has broad authority, which they seek to exercise as rarely as possible; instead, they use this power to establish standard processes**, like those proposed in the other 801x-series PEPs.

To let community decide **they set a private poll** (using CIVS, a free Internet voting service) **available for 2-week-long window** on December 2018. **Every committer received an email with a link allowing them to rank the proposals in their order of preference**. The results of the election, including anonymized ballots, were public on December 17th, after the election ended. The whole details on the voting process were very well described in a PEP created for this specific purpose, and probably was the first community-wide decision they had to take.

After the election completed the result was that **PEP 8016: The Steering Council Model was selected as the winner**. Then they defined the formal goverance process for Python around the steering council (a 5-person committee), which has broad authority but seek to exercise as rarely as possible, and also run another voting process to make the first steering council election in January 2019. Since then, A new council is elected after each feature release. Each council's term runs from when their election results are finalized until the next council's term starts. There are no term limits.

The **main duties of the Steering Council** are:

- Maintain the quality and stability of the Python language and CPython interpreter.
- Make contributing as accessible, inclusive, and sustainable as possible.
- Formalize and maintain the relationship between the core team and the PSF.
- Establish appropriate decision-making processes for PEPs. Accept or reject PEPs.
- Seek consensus among contributors and the core team before acting in a formal capacity.
- Act as a "court of final appeal" for decisions where all other methods have failed.
- Enforce or update the project's code of conduct.
- Work with the PSF to manage any project assets.
- Delegate parts of their authority to other subcommittees or processes.

Although the Steering Council is the main governance authority of the Python project there is **the core team**, the group of trusted volunteers who manage Python, **who also make decisions that shape the future of the project**. They have authority over the Python Project infrastructure, including the Python Project website itself, the Python GitHub organization and repositories, the bug tracker, the mailing lists, IRC channels, etc. And they also may participate in formal votes, typically to nominate new team members and to elect the steering council.

### PHP

Created in 1994 by Rasmus Lerdorf and originally used for tracking visits to his online resume, he named the suite of scripts "Personal Home Page Tools," more frequently referenced as "PHP Tools". In **June of 1995**, Rasmus **released the source code to the public, which allowed developers to use it and encouraged them to provide fixes for bugs in the code**, and to generally improve upon it. After a couple of years and a subsequently various releases, **the governance and direction of the project was largely dictated by the simple concept of** what has been known in the PHP community as **"karma"**: the more contributions you made to the project the more clout you had when it came to deciding which features made it into a release.

From the beginning, PHP was a language born of an itch to scratch. Solutions, rather than concerns over consistency or academic purity, have always been a main goal of the project. But this led to **plenty of problems in regards to governance**, with the community having to face a crisis related to some feAtures of PHP4. A certain amount of community members started to get the **feeling of the project being run by benevolent dictators with commercial interests** could have ended with a fork in 2002.

After those tense years things have changed significantly. **PHP matured** both as a language and project, and moved away from the practices of the past **and adopted a Request For Comments (RFC) process** to govern the discussion of how new features, both ideas and implementations, are brought into the language.

**The basic steps for getting new code into a PHP release via the RFC process are fairly straightforward today** — the first step is to document the proposal in the RFC section of the PHP wiki, followed by sending an email to the Internals mailing list. The matter is discussed (or not) for a minimum of two weeks, changes made as necessary to the RFC, and ultimately the author of the RFC opens the issue up for a vote or the RFC is withdrawn. If the measure passes, then a new thing in the PHP community is approved. If not, there are opportunities to try again in the future.

But **who gets to vote, and what constitutes a passing majority** are both questions whose answers **have caused a little bit of controversy in recent times**. Specifically the concept that so many decisions could be made by a simple majority, has been something that has bothered members of the internals community for quite some time and a RFC to remedy it was introduced in 2016, although it wasn't discussed until 2019 when a contributor took issue with other contributors' perceived abuses of the simple majority clause to push certain RFC in their own particular interest (using the simple majority and short voting periods to get quick approval).

In the end **the RFC to remove simple majorities for future RFCs won adoption**, with a clear majority of thirty in favor and two against. In addition to this, a RFC for abolish short period votes was also adopted.

As for who has the right to vote on RFCs, **PHP only requires a GitHub account and code contributions to the project**, with no limitations on when those contributions were made. As a result, language features and procedure changes are generally decided by those who show up to cast their ballot. As an example of how democratic the process is PHP founder Rasmus Lerdorf and other prominent contributors were overruled in a vote of 108 to 48 after heated debate.

To sum up, **the RFC process has done a great deal to democratize these conflicts** and move away from the benevolent dictator approaches of the past, but little to remove the conflicts themselves. One welcome thing **it does provide is a clear path for new contributors to make small contributions**, such as a single useful function, and succeed in seeing their ideas make it into releases without a great deal of turmoil. For the contributor who is looking to become involved in heavier project decisions however, they will still find it to be at times a discouraging process and should expect to defend their ideas when attempts are made to tear those ideas asunder by more seasoned contributors.

### Node JS

In 2014 **some of the core contributors started to push Joyent** (main sponsor of Node.js at that time) to move the project into a structure where the contributors and community could step in **to solve some of the problems Node was facing**:

- The number of releases of node had been drastically reduced.
- The number of commits on the Node.js repo had been steadily decreasing.

But one of the main reasons was the **discontent dissatisfaction over Joyent's stewardship of the Node.js project**.

As a result **four of Node's top 5 contributors forked the project creating io.js**. This fork was initialy only as an exploration by some of the key contributors in the Node core community with the following intent:

- Accelerate release of latest advancements in JavaScript as fast as the community feels necessary.
- Support an open governance model as against a single corporate stewardship.

Joyent responded by forming the Node Advisory Board to set up open governance, but **the fork only highlights the tension between corporate sponsor of an open source project and the community of developers contributing to it**.

After months of pressure, **Joyent backed down as steward and handed Node off to a new independent organization, the Node.js Foundation**, resulting in Node.js as a whole moving forward much faster and that many of the original contributors returned to work on the same codebase. Then some of the ideas of io.js regarding governance were adopted when merging, **leading to an open governance model and Node.js running smoothly**. Some of these ideas are briefly described as follow.

They started setting up a **new vocabulary to clearly identify members of the community**:

> - A **Contributor** is any individual creating or commenting on an issue or pull request.
> - A **Committer** is a subset of contributors who have been given write access to the repository.
> - A **TC (Technical Committee)** is a group of committers representing the required technical expertise to resolve rare disputes.

**Every person who shows up to comment on an issue or submit code is a member of a project's community**. Just being able to see them means that they have crossed the line from being a user to being a contributor. They consider that **creating barriers to entry just reduces the number of people** there's a chance to identify, educate and potentially grow into greater contributors.

In addition to this, they explained the so called **"liberal model" of open governance** in their repository documentation. Some of the ideas are:

> The goal of this document is to create a contribution process that:
>
> - Encourages new contributions.
> - Encourages contributors to remain involved.
> - Avoids unnecessary processes and bureaucracy whenever possible.
> - Creates a transparent decision making process which makes it clear how contributors can be involved in decision making.

**The purpose of this policy is to gain contributors, to retain them as much as possible**, and to use a much larger and growing contributor base to manage the corresponding influx of contributions.

> The default for each contribution is that it is accepted once no committer has an objection. During review committers may also request that a specific contributor who is most versed in a particular area gives a “LGTM” before the PR can be merged. There is no additional “sign off” process for contributions to land. Once all issues brought by committers are addressed it can be landed by any committer.

**A key part of the liberal contribution policies they built was an inversion of the typical code review process**. Rather than the default mode for a change to be rejected until enough people sign off, they made the **default for every change to be integrated**. This put the onus on reviewers to note exactly what adjustments need to be made in order for it to be integrated.

For new contributors it's a big leap just to get that initial code up and sent. **Viewing the code review process as a series of small adjustments and education**, rather than a quality control hierarchy, **does a lot to encourage and retain these new contributors**.

> In the case of an objection being raised in a pull request by another committer, all involved committers should seek to arrive at a consensus by way of addressing concerns being expressed by discussion, compromise on the proposed change, or withdrawal of the proposed change.

This is what we have seen before as a **"lazy consensus" seeking process**. Most review comments and adjustments are uncontroversial and the process should optimize for getting them in without unnecessary efforts.

> If a contribution is controversial and committers cannot agree about how to get it to land or if it should land then it should be escalated to the TC.

For the **minority of changes that are controversial and don't reach an easy consensus** they recommend to **escalate** them to the TC.

> All contributors who land a non-trivial contribution should be on-boarded in a timely manner, and added as a committer, and be given write access to the repository.

Not every committer has the rights to release or make high level decisions, so they can be much more liberal about giving out commit rights. That increases the committer base for code review and bug triage. This is **the key to scaling contribution growth: committer growth**.

> The TC uses a “consensus seeking” process for issues that are escalated to the TC. The group tries to find a resolution that has no open objections among TC members. If a consensus cannot be reached that has no objections then a majority wins vote is called. It is also expected that the majority of decisions made by the TC are via a consensus seeking process and that voting is only used as a last-resort.

**Pure consensus systems incentivize obstructionism** which they want to avoid. In pure consensus everyone essentially has a veto. So, if I don’t want something to happen I’m in a strong position of power over everyone that wants something to happen. They have to convince me and I don’t have to convince anyone else of anything.

**To avoid this they use again the system of “consensus seeking”** which has a long history outside of open source. **It's quite simple, just attempt to reach a consensus, if a consensus can't be reached then call for a majority wins vote**.

Just **the fact that a vote is a possibility means that people can't be obstructionists**, whether someone favor a change or not, they have to convince their peers and if they aren't willing to put in the work to convince their peers then they probably don't involve themselves in that decision at all.

> Resolution may involve returning the issue to committers with suggestions on how to move forward towards a consensus. It is not expected that a meeting of the TC will resolve all issues on its agenda during that meeting and may prefer to continue the discussion happening among the committers.

They were focused in **avoid creating big decision hierarchies**. Instead, they bet for investing in a broad, growing and empowered contributorship that can make progress without intervention.

> Members can be added to the TC at any time. Any committer can nominate another committer to the TC and the TC uses its standard consensus seeking process to evaluate whether or not to add this new member. Members who do not participate consistently at the level of a majority of the other members are expected to resign.

As a project grows it's important to **add people from a variety of skill sets**. If people are doing a lot of docs work, or test work, treat the investment they are making as equally valuable as the hard technical stuff.

## Defining our Governance Model

**Open Source projects rarely begin by "selecting" and implementing a perfectly preconceived governance model**. Much more commonly, projects' governance models evolve as their communities grow and diversify. But **it is never too soon to define a suitable governance model**. Without one, the chances of third parties wishing to contribute are slightly reduced. This is for a number of reasons:

- Potential contributors will not know how to contribute.
- They will not be sure what will happen to their contribution.
- The project will not look serious about engaging with third parties.
- There is no visible assurance that contributions will be managed in such a way that they will remain of value to the original contributor.

But at the same time, most governance models consist of **two primary dimensions: roles, and policies and procedures**. The basic requirements here can be evolved as the project grows.

There is **no need for the first version of the project's governance model to be fully detailed**. A framework setting out the starting position is sufficient. Nor does the governance document need to account for every possible future scenario. **The idea is to start with a simple and manageable model that will send clear signals to potential contributors**.

For the sake of transparency, **governance documentation** (like technical documentation) **should explain how things actually work**. If there are aspirational goals, those go in their own section under "Roadmap" or "TODO".

In order to be effective, a governance document needs to be concise, accessible and easy to refer to. The **main sections** of a typical governance document include:

- **Overview**. The overview should be short, as the objective is to give people an immediate understanding of what is expected of them if they wish to engage with the project.
- **Roles and responsibilities**. Your project could have a variety of real roles, but you only need to define a handful of them to start out.
- **Support**. This section documents support processes within the project. For most open source projects, the support channels are the main contact with users of the project, so we have to be sure of providing enough information about how each is used.
- **Decision making process**. The efficiency and transparency of the decision making process should be the main focus of this section of the governance document.
- **Contribution process**. It details the various types of contribution being sought and the tools available for making and managing those contributions. It should also describe what happens once a contribution has been made by a third party, including details of the process that is followed when a contribution is deemed unsuitable for the project.

# Sources

- [Projects that make their rules explicit would see more participation](https://opensource.com/open-organization/18/4/new-governance-model-research)
- [Leadership and Governance](https://opensource.guide/leadership-and-governance/)
- [Meritocracy](https://geekfeminism.wikia.org/wiki/Meritocracy)
  https://geekfeminismdotorg.wordpress.com/2009/11/29/questioning-the-merit-of-meritocracy/
- [Community-Led development "The Apache Way - How it works"](https://www.apache.org/foundation/how-it-works.html)
- [Community-Led development "The Apache Way" - Voting](https://www.apache.org/foundation/voting.html)
- [Guido van Rossum on mailing list [python-committers] Transfer of power](https://mail.python.org/pipermail/python-committers/2018-July/005664.html)
- [Python Language Governance Proposal Overview -- PEP 8000](https://www.python.org/dev/peps/pep-8000/)
- [Python Governance Voting Process -- PEP 8001](https://www.python.org/dev/peps/pep-8001/)
- [Python governance vote (December 2018): Results](https://discuss.python.org/t/python-governance-vote-december-2018-results/546)
- [CIVS Condorcet Internet Voting Service](https://civs.cs.cornell.edu/)
- [Python Language Governance -- PEP 13](https://www.python.org/dev/peps/pep-0013/)
- [Python January 2019 steering council election -- PEP 8100](https://www.python.org/dev/peps/pep-8100/)
- [History of PHP](https://www.php.net/manual/en/history.php.php)
- [The history and evolution of PHP governance](https://lwn.net/Articles/821821/)
- [PHP RFC: Abolish Narrow Margins](https://wiki.php.net/rfc/abolish-narrow-margins)
- [PHP RFC: Abolish Short Votes](https://wiki.php.net/rfc/abolish-short-votes)
- [Request for Comments: Voting on PHP features](https://wiki.php.net/RFC/voting#voting)
- [Healthy Open Source](https://medium.com/the-node-js-collection/healthy-open-source-967fa8be7951)
- [Level projects basic contributing definition](https://github.com/Level/community/blob/master/CONTRIBUTING.md)
- [io.js Project Governance](https://github.com/nodejs/node/blob/v1.x/GOVERNANCE.md#iojs-project-governance)
- [io.js and a node.js Foundation](https://medium.com/@iojs/io-js-and-a-node-js-foundation-4e14699fb7be)
- [Node.js vs io.js: Why the fork?!?](http://anandmanisankar.com/posts/nodejs-iojs-why-the-fork/)
- [Node.js and io.js are settling their differences, merging back together](https://thenextweb.com/dd/2015/06/16/node-js-and-io-js-are-settling-their-differences-merging-back-together/)
- [Who’s Going To Run Node.js, And Why That Matters](https://readwrite.com/2015/02/20/node-js-foundation-io-js-whos-going-to-run-it/)
- [io.js and Node.js Have United and That’s a Good Thing](https://thenewstack.io/io-js-and-node-js-have-united-and-thats-a-good-thing/)
- [The Open Source Way Project and Community Governance](https://www.theopensourceway.org/the_open_source_way-guidebook-2.0.html#_project_and_community_governance)
- [Producing OSS. Consensus-based Democracy](https://producingoss.com/en/consensus-democracy.html)
- [OSS Watch - Governance Models](http://oss-watch.ac.uk/resources/governancemodels)
- [Open governance: It's all about community](https://developer.ibm.com/articles/open-governance-community/)
- [Understanding open source governance models](https://www.redhat.com/en/blog/understanding-open-source-governance-models)
