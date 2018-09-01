---
title: "Senior data scientist interview: Raquel H Ribeiro"
date: 2018-06-04T08:00:49+01:00
draft: false
categories: ["Interviews", "Manager Interviews"]
tags: ["Data Science", "Machine Learning", "Women in Tech Interviews"]
interviewee_name: "Raquel H Ribeiro"
interviewee_role: "Senior Data Scientist"
interviewee_company: ""
small_images:
- "/img/raquel-ribeiro.jpeg"
---

<img src='/img/raquel-ribeiro.jpeg' style='float:right; width:200px;margin-left:15px'/>

I met [Raquel H Ribeiro](https://www.linkedin.com/in/raquelhribeiro/) when I
worked at [Feedzai](https://feedzai.com/) fighting fraud. She was part of
the team of data scientists that built the tooling to detect fraudulent
operations. 

It was always very interesting to talk with her about the new fraudster's
trends and how were they coping with that.

And her being a Cosmologist, it was usual to have lunches where we asked
all sort of _astronomical_ things. I still remember her trying to explain high
levels of abstraction to us, but it was really hard to keep up.

<div style='clear:both'></div>

<!--more-->

> Hey Raquel. :) Can you talk a little about your background and introduce
> yourself?

Hey Pedro! :) Of course, and thanks for having me on your blog!

My name is Raquel, I am a data scientist but a theoretical physicist by training.
I knew I wanted to become a scientist since I was at least 6 years old. Being
a nocturnal person by nature, I would stay up until very late at night when I
could gaze at the sky and look at the stars. You might think I was on track to
become an astronomer, but instead I enrolled in Physics at the University of
Porto following a teacher's advice: a solid foundation in Mathematics and
Physics is valuable to many interesting subjects, not only Astronomy.

After concluding my BSc, I went to Cambridge in England to enter the famous
Part III of the Mathematical Tripos, which is now known as a Masters in Advanced
Study in Maths. Like everyone else in my department, I wanted to study where
Stephen Hawking was, and after studying really hard, I was able to secure a place
as a PhD student in his department. My research was on the Physics of the Big
Bang revealed by the statistical imprints of the oldest light in the universe,
which has travelled over 13 billion of years to reach us today. I went on to
keep studying the universe as a researcher in the U.S. and then back in the U.K..

In Cosmology, data is king and I soon found myself very interested in more
applied research, and decided to exchange academia for a job in the industry.
I worked for a startup in London, mainly in forecasting and market segmentation,
before accepting Feedzai's invitation to return to Portugal and join the data
science team as a senior data scientist.

And that's where we crossed paths, Pedro! :)

> That's an amazing background. I believe that sometimes coming from other areas
> allow us to see things very differently. For example, did your specific
> background in Cosmology give you extra tools while working as a data scientist?

That's a deep question, and let me warn you about the long answer that follows.
I think you are cleverly asking two questions actually:

1. whether having a very high academic degree, such as a PhD, can be helpful to
   become a data scientist
1. whether being specifically a cosmologist can give you an edge as a data
   scientist.

Generically, I think the answer to both questions is "yes".

Let me start with **1)**. Having a PhD in a technical background is not mandatory
to become a good data scientist. Having a PhD however, shows potential employers
that you have an inquisitive mind, are used to thinking outside the box and
persistence is your middle name. The standard experience for a PhD student is
to find road block after road block, and keep going, successfully circumventing
obstacles (abstract, or technical) on the way.
It also shows you're born as a motivated person and willing to learn. And this
is paramount to being a good data scientist.

Now to **2)**. A cosmologist has a solid knowledge of mathematical methods,
statistics, quantum field theory and gravitation. Above all, we're used to
modelling highly non-linear effects through detailed statistics, and then check
whether the predictions from our theories match the observations. By decoding
the faintest of signals, we can unveil fundamental pieces of micro-physics since
Cosmology is inherently a data-driven science.
All in all, our day to day involves solving data science problems at the largest
scales and the universe is our data lake. In the industry, a cosmologist has
the chance to test ideas in real time, rather than waiting for the next
cosmological survey to be launched into space.

If I had to single out one particular skill that being a cosmologist brings to
the table is the ability we have of focusing on the most intricate integrals
and equations and, at the same time, have the overarching big picture of the
problem at hand. This is crucial when we are solving a business problem: we zoom
in the maths and statistics without losing the underlying business directives.

Take [Adam Kelleher](https://www.linkedin.com/in/adam-kelleher-70912914/) for
example who, [just this week](https://www.businesswire.com/news/home/20180517005655/en/Barclays-Appoints-Adam-Kelleher-Chief-Data-Scientist),
was hired by Barclays as Director and Chief Data Scientist for Research in New
York. There's also [Morag Scrimgeour](https://www.linkedin.com/in/mscrim/) who
works as a Data Scientist for Square in San Francisco, and
[Ian Huston](https://www.linkedin.com/in/ihuston/) who is a Data Science Director
at Pivotal Labs in Dublin. They are all my friends and cosmologists by training.
I don't think it is a coincidence that they all have amazing, impactful jobs!

> Well, I'm sold on Cosmology. :) I actually don't quite know what a data
> scientist does. Can you give an overview of how do you approach problems,
> what are your typical tools and what are your success scenarios?

A data scientist looks for patterns in the data that can answer business
questions and she/he frequently provides insights into problems even before the
company itself becomes aware of them.

For context, imagine you're a data scientist at Company X-awesome and you've
been asked to run a forecasting model to determine the number of brussel sprouts
supermarket Y-fancy will sell in a given day. They give you a dataset and tell
you to start the analysis.

As a data scientist, you won't leave the meeting room until you've asked a few
questions to the Y-fancy's business stakeholders:

**1) "Alright, so you're interested in forecasting demand and the target
variable is the number of sales per day. How far ahead into the future do
you want to look at?"**
This is crucial as it will affect your methodology. Looking two days ahead is
very different from looking two months into the future.

**2) "Is this model going to run in a production environment system?"**
Why would it make a difference, you might ask? Well, in a production system,
if speed is important, simpler models will run faster at the cost of perhaps
losing on the accuracy metric.

**3) "What metrics do you want the model to maximise/minimise?"**
Brussel sprouts are clearly a perishable product and as such, from an economical
standpoint, it might be better to under-forecast than forecast in excess.

**4) "Do you want to understand what is behind the model's predictions? For 
example, whether the temperature or the flu season might influence the
sales figures?"**
This question addresses interpretability, and though in some cases the business
is only interested in an accurate prediction, sometimes it values knowing what
is driving the sales just as much.
The answers to 2), 3) and 4) will allow you to choose from the different machine
learning models you can train to learn the (sometimes hidden from sight) patterns
embedded in the data. The model should be able to determine even non-linear
relationships between predictive features and the target variable.

**5) "I've noticed you've provided one-year worth of data. Can I have some
more please?"**
As a rule of thumb, in time series problems more data and more recent data are
always better. Yearly patterns can only be captured if you allow your model to
see seasonal behaviour.

**6) "Finally, how actionable are my insights going to be?"**
That is, what is the purpose of this analysis? Is Y-fancy only interested in
benchmarking? Is forecasting demand the right question they should be asking?

Back to your desk, you start by running a thorough exploratory data analysis.
The model is only as good as the data it uses, so you extract as much
information from that dataset as possible. Typically, you will use R or Python,
and data visualisation is your favourite friend. You decide to go with linear
regression. You train a model, test it and compute the model's accuracy. But
what is a good value for accuracy?

How about comparing the results of your model with a naive guess, like the
prediction for tomorrow's sales is simply what the supermarket has sold today?
Also, does your model have any unexpected behaviour?

As far as success criteria go, once you're satisfied that your model provides
accurate forecasts and answers all the questions you've raised above, then
you're ready to show your model to the business.

> It's much more clear to me know. Could we use those techniques for a different
> kind of questions? Following your example: I may not want to know how much
> brussel sprouts I will sell, but I do want to know what things I can do to
> boost the sales of that in 15%.

> This maps to SaaS services. How can I make an informed decision about which
> features should I build next? What can I do to lower churn?

> And, if theses questions are not answerable, what other questions could we
> do to help us in these scenarios?

Great points Pedro! Data Science is indeed very powerful and, as a point of
principle, it should enable you with tools to answer all those questions
(within certain confidence intervals, of course). If you have a model that
forecasts sales, you can disclose which features most influenced the predictions
you get.

There are a number of ways of doing so essentially based on how we statistically
measure the influence of predictors on the target variable. At the same time,
you can also borrow the econometrics toolkit.
It teaches us how to isolate the purely causal effects whilst factoring out
the simple correlation ones. For example, if you invest in a media campaign,
based on historical data, what is the percentage of increase on sales?

> I see. So we can get a huge value from a data science squad. What would be
> your approach to introduce these practices on a company that doesn't have
> a background in that area?

It depends a lot on the type of company and how it feels about Data Science.
Some companies respond to the online "hype" that Data Science can solve
everything with very high expectations. Others are more cautious and want to
explicitly check the added value in their specific circumstances before
committing to a team budget.

A consultancy boutique might want to start its Data Science squad with data
analysts who, together with technical consultants, are able to directly answer
business questions using the data. Getting back to that example of sales
before, the data analyst might use more traditional forecasting methods (ARIMA,
for example) which are based on purely time series behaviour. This team can
then later evolve into hiring data scientists, who will explore that data in
more depth and extract even more value from it, using machine learning. A
data scientist can find that there is significant scope/ROI in developing a
recommendation system based on the products purchased by a sample of
the population. The data scientist will also take the lead on defining the
approach and success criteria.

For a product company however, I am now completely convinced that the most
productive way of starting a DS squad is to first hire a solid team of Data
Engineers who ensure that data can be retrieved seamlessly and incorporated
into a given data pipeline (for data analysis and model building, for example).
**Such groundwork needs to be in place before hiring Data Scientists so that
they can focus on the data rather than on the infrastructure.**

A balanced, fully grown data team will have software engineers, data engineers,
data analysts, and data scientists. The ratio of each profile will depend on
the company. As the team starts small, there's no need for line managers, and
the team's productivity will be monitored by the team manager.

> Before we continue, could you just elaborate on what's the difference and
> the responsibilities of data engineers, data analysts and data scientists?

Usually, at a very young start-up, these definitions strongly overlap as a data
scientist might be working a lot on different domains. In more mature companies,
the organisation of different job titles might be a bit blurred too. However,
these jobs entail **_very different responsibilities_** and it is not just a matter
of syntax, but rather of experience and skill set.

* a **data analyst** will have a specific data task at hand, and is able to use
  already available tools to answer questions about the data. His/Her skill set
  is traditionally related to SQL-type of analysis, coupled with data
  visualisation and basic coding (R has become a popular language for both
  coding and producing reports). Often, the data analyst is a junior data
  scientist who will interpret data signals to understand how the data behaved
  in the past.
* a **data scientist** has significantly more experience than a data analyst
  and his/her skill set and responsibility supersede that of a data analyst.
  Not requiring a lot of direction to produce insights from data, they usually
  have a solid scientific background, being used to hit the ground running in
  open-ended projects. They are comfortable in using mathematically complex
  algorithms to deliver results. If there are no appropriate tools to solve a
  given challenge, they will created them, and this versatility can have a
  significant impact in the company's data strategy in defining roadmaps.
* a **data engineer** takes the data analyst's and data scientist's job to the
  next level. He/She will oversee the implementation of a given data pipeline
  or model prediction into production, identifying the data infrastructure
  requirements, the algorithms' implementations, whilst focusing on the pipeline
  for data storage and retrieval.

Building up on the example I have given before:

* the **data analyst** will run an ARIMA time series analysis on a dataset to
  produce forecasts based on previous behaviour.
* the **data scientist** will augment the dataset with other predictors, such
  as weather variables and other competitors' statistics, to understand how
  different factors influence sales and hence produce a more robust forecast
  through leveraging methods such as ARIMA with machine learning algorithms.
* the **data engineer** will ensure that the algorithm implemented by the data
  scientist can produce predictions within an agreed time frame, that the data
  pipeline is scalable, whilst ensuring data quality in production.

> Going back to your previous question, I do feel that some startups I've
> worked at do gather data. They gather lots of data. But they can't extract
> valuable information from it. Do you have some guidelines on how to improve
> this process when someone doesn't have a background in the data world?

You're completely right in that a large number of companies gather a tremendous
amount of data. Before jumping into hiring data scientists, they should probably
find the answers to the following questions:

* **How large is your data lake and how good is your data?**
  Most of the data science techniques require a decent amount of data so as to
  apply meaningful analysis and make predictions. Imagine a start-up can gather
  a lot of data, but every three days it deletes old data owing to storage
  limitations. What can be done with three-days old data?
  Also, regardless of how good a given algorithm can be, if your data is not
  properly cleaned or relevant (there is not enough good data), your insights
  won't be helpful. Say that, coming back to the start-up example, we don't
  have enough context for the data (we don't know how to append geographical
  data, for example). So, first things first: you need to access data quality.
* **What are the most pressing business questions your company ought to address.**
  To make sense of data, we need to frame concrete business problems which we
  can tackle with data science tools. Perhaps the main start-up's objective is
  to determine churn, and this is a concrete enough problem that can be solved
  through data analysis. Moreover, to evaluate the models we create, we need to
  focus on a few meaningful metrics, dictated by the business directives. What 
  is the relevant timescale in the company's definition of churn? What is the
  relevant timescale? Once the business objectives and the metrics that should
  be maximised are identified, you can move on to the next requirement.
* **Are the senior stakeholders ready to take the data science findings on board?**
  Whilst getting excited about having data science sprinkling data with
  statistical fairy dust, business should also act on its findings and promote
  a data-driven culture. Suppose that the company is still rooted in a more
  traditional strategy to determine churn, and downplays the suggestions
  proposed by data science. In this situation, data that is being harvested is
  only meaningful if it is actionable.

> Imagine that we already have a good data lake, the business questions to ask
> and an actual data squad. What are your tips to manage this team? What would
> they value that will make them productive and happy? How can a line manager
> make them grow and take the most out of the team?

Being a **_good manager_** takes time and, from my experience and somewhat
contrary to traditional belief, it requires a high emotional QI (rather than a
good plain QI), and someone who can see beyond the project that her/his team
is working on.

Let me try to break this down a bit more.
Ideally one would be able to choose the team members from the start. This is
really important: ensuring that each member has a different breath of strengths
(technical skills and emotional intelligence) is key in establishing the
group's ecosystem of culture. Having a good blend of junior/mid-level/senior
members allows for cross-pollination which affects the team's agility. Also,
you will be working with your group 8 hours per day, 5 days a week. Getting
along well with them socially is as important as technically.

There are three skills that managers should cultivate in their group:

**1) Compassion.** This may appear a bit random, but it's far from it. Think
about it:

_When you had a manager, what could have gone better? What would you wish
they had done differently for you and for the team?_

Doing for others what you wish had been done for you is by far the best
exercise I've done as a manager, and you will see that your colleagues will
appreciate the extra efforts. Recently, a work colleague, who has become a
friend, remembered me about something that I had forgotten about my own
management style: leaders lead by example and when the team appreciates this,
you have yourself a solid basis for a healthy group.

**2) Empowerment.** This is an elastic description and it starts being developed
right from the start when you need to design the group's technical roadmap and
map each task with each person.

Suppose that one of the team members is very good at thinking outside the box.
You should take this skill to the next level and give them tasks in which they
can revisit processes and concepts and improve them beyond the usual
expectations. Not only is this good for your project but this is also paramount
in building the person's confidence since they are using the skills they are
best at to promote structural improvements in the project. It's a win-win and
it paves the way towards developing other skills which can be matured.
And this is where 1:1s play a pivotal role: the manager should gather thoughts
on how each member of the group feels about their skills and how they want to
evolve. Perhaps they want to evolve in a more technical arena, or perhaps they
are ready to take ownership of a specific project component. Whichever course
of action, you can both develop a career plan which they own and are happy
with. This career plan should be pliable, rather than be set in stone and
context-dependent: projects change and so do people's motivations, but the
same underlying skills can be developed in a multitude of ways.

Above all, the manager should make sure that each member of the group feels an
integrand part of the roadmap, actively participating in decisions which can
affect the group's structure and work. Consequently, team members feel empowered,
challenged and shine their best, whilst feeling valued.

**3) Motivation.** This is hard to rub in the team but so rewarding when it
happens. Data scientists are naturally smart and eager to keep pushing the
boundaries of their knowledge. Self-improvement is a great motivator as is
providing your team with the big picture of the project and where it sits
within the company's business objectives. Keeping your team motivated is
instrumental in making them feeling productive and engaged: it means having
actionable brainstorming sessions and meetings, and working towards a more
detailed and rigorous overarching roadmap. Then you top this with data scientists
feeling valued, and this makes a happy team.

Managing a team requires humility and a growth mindset. It's much easier to find
someone with a good technical expertise (even in Data Science!) than a good
manager. They are neither mutually exclusive nor equivalent: a good manager
might not have the technical breath as the other members of the team, and the
most qualified person in the team might not be a good manager. However, having
both profiles within a team is extremely important. Finding someone who
single-handedly embraces technicality as much as management skills is hard,
very hard.

> Totally agree. One last question: what advice and tips would you give to
> someone that needs to hire the fist data scientist, but doesn't know much
> about the field?

The first data scientist will set the framework first developed by your Data
Engineering team, as well as the coding standards and culture—thus you want to
get it right first time around.

Here are a couple of tips:

a) Your best bet is to hire someone experienced in the domain of the business
   problems they are likely to tackle in your company. Experience here doesn't
   necessarily require 5 years in the industry nor a PhD in Computed Science
   (though I believe that a PhD in a quantitative field is a major plus). I
   believe that someone who has, say, 2-3 years in diverse industries
   (academia+industry, for example) will probably be a good fit, skills-wise.

b) Pick someone who is used to benchmarking methodologies and has some
   experience in preparing (data) strategies. They will be used to messy
   states and will know their way around such challenges.

c) If you're using outsourcing recruitment agencies, make sure they choose an
   experienced recruiter to look for your candidates (experienced data scientists
   don't usually appreciate standard cold calls that are vague in the job
   details and confuse a Software Engineer's skills with those of a
   Data Scientist).

d) Once in the interview stage, prepare a transparent interview. That is, be
   upfront about the company's expectations for that role, and ask questions
   which are intrinsically related to the job. For example, don't ask questions
   on convolutional neural networks just because you've read about deep
   learning.The interviewee herself/himself will spot this one mile away.
   Rather focus on how the interviewee's skills can be an asset for the company.

e) Once you find this person, you might think your job is done, but not quite
   yet. Make sure they are included in key business decisions and understand
   how to shape their Data Science group within the company. It is not
   infrequent to see data teams completely isolated of the other departments in
   a company, and this will not be very motivating for your first data
   scientist, so make sure they feel included and valued within the company.

> Great tips. Thanks for answering my questions, I really liked this
> interviewed. I learned a lot and now have several concepts more clear in my
> mind. As a closing note, could you reference some topics that you'd like to
> see discussed on an engineering management blog? And can you reference
> someone for me to interview next? :)

Thanks Pedro, it was such an enjoyable experience! Let me also take this
opportunity to thank you for sharing both your experience and advice. Your blog
contains such an incredible admixture of content that I reckon everyone in
tech would find it very helpful, regardless of the stage in their careers.

There are a few themes which I think would be really interesting, and about
which I'm frequently approached on social media to comment on. Those would be:

* mentorship in tech jobs (_what to look for and how to find a good mentor?_)
* how to prepare for an interview
* how to negotiate your offer package

It would be fantastic if you could discuss these on your blog!

There are so many interesting people in Lisbon's tech scene nowadays that it
is hard to only name one! I nominate [Sílvio Rodrigues](https://github.com/sfrodrigues) — he is
the co-founder of a recently founded start-up and I'm sure he will have an
insightful experience to share, from starting a company to building his team!

And thanks again Pedro!
