# Open-Items

A [free](https://en.wikipedia.org/wiki/Free_software) and [open-source](https://en.wikipedia.org/wiki/Open-source_software) ([FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software)), secure, [self-hostable](https://en.wikipedia.org/wiki/Self-hosting_(web_services)) and [cross-platform](https://en.wikipedia.org/wiki/Cross-platform_software) application for creating, managing, and sharing lists.

A **list** (or **collection**) is a grouping of **items**.
This application aims to be versatile and will handle various types of lists including checklists, ordered lists, and unordered lists.
Examples of lists can range from groceries to task lists, shopping lists, recipe ingredients, top-ten lists, and more.
Each item can also be a collection itself, enabling infinite collections nesting for improved organization and readability.

## Value proposition

Open-Items offers a solution for organizing thoughts and sharing ideas or plans with others in list format, while ensuring privacy and secure storage of personal information.

For users who prioritize complete control over their data, Open-Items will offer a self-hosting option.
This will allow users to host the application on their own servers or cloud platforms, ensuring that their data remains within their desired infrastructure.
Self-hosting, alongside open-source, empowers users with greater control, privacy, and the ability to customize the application according to their specific requirements.

Open-Items will be designed to be cross-platform, supporting a wide range of devices and operating systems.
Whether users prefer to access the application from their desktop, mobile devices, or web browsers, Open-Items ensures a consistent experience across platforms, enabling seamless access to their lists from anywhere, at any time.

This comprehensive application aims to cater to users seeking an organized, collaborative, and secure platform for managing their lists efficiently.

## Requirements

### Functional requirements

* User account registration and login process for users to issue and manage their collections.
* Create and manage collections inside the application. Users should be capable of creating, editing, renaming, deleting, ... collections.
* Flexible sorting options for collections: creation time, alphabetical order, custom arrangement, ...
* Accounts synchronization: users will have theirs lists seamlessly synced between all the devices they are logged into.
* Full offline support: users will have the possibility of creating offline/local "accounts". Collections/data of offline accounts will never leave the device they were created on for maximum privacy.
* Ability to share lists with others through various channels such as emails, shareable links, in-app username based invites, ... Recipients will then need to accept the pending invite from their application. This feature will greatly enhance the application's capabilities, facilitating collaborative work on a shared list.
* Cross-platform compatibility will allow users to access and interact with their collections from various devices.
* Users will be able to export their collections to JSON or plaintext (to clipboard). JSON exports will enable users to re-import lists in case they would need to, while plaintext exports allows using/sharing lists with other applications (messaging apps, documents, ...).
* Efficient search functionality will help users to quickly find a list or an item inside their account.
* Users will be able to archive any of their lists when they feel like they don't use them anymore. The archived lists will stay in the user's account on their app, but in a different place and read-only. This allows for improved organization of lists across the app and prevents old lists taking space when it is not required, while preserving accessibility.
* Collections can be moved around in the hierarchy and even across accounts.
* A local duplicate of recently deleted collections will remain accessible through the application on the device from which they were removed. This feature enables quick and seamless recovery of collections that were mistakenly deleted.

### Technical specifications

#### Client

* Developed using the [Dart](https://dart.dev/) programming language, powered by the [Flutter](https://flutter.dev/) framework for cross-platform compatibility and high level widget-oriented programming.
* Intuitive, minimalistic and easy to use design for the user interface.
* Local No-SQL database for managing persisted offline snapshots of the user data and for offline accounts support.

#### Server

* Developed using the [Rust](https://www.rust-lang.org/) programming language.
* REST API for communication with clients, API versioning and migrations.
* Packaged and distributed using [Docker](https://www.docker.com/) for easy self-hosting capabilities.
* Official project instance hosted on a [Virtual Private Server](https://en.wikipedia.org/wiki/Virtual_private_server) with its own domain (https://open-items.org) for easy accessibility.
* Automated backup and recovery mechanisms to prevent data loss and ensure the availability of user data in the event of server failures or other technical issues.
* Status service sharing the state of the servers anytime, informing users about potential maintenances or downtimes.

### Constraints

* **Budget constraints**: The project must be cost-effective, considering expenses such as domain registration and server hosting.
* **Legal considerations**: Users must be explicitly informed that the server provider is not responsible for the storage or delivery of their data, and no warranties are provided. Additionally, the option for self-hosting will be available if users wants more control over their data or server performances.

## Academic bachelor project

The development of the Open-Items project represents a huge amount of work.
As part of my bachelor project, the focus will be on developing the cross-platform client for Open-Items.
The client will be fully functional offline, with everything ready to accept online support once the server-side code is developed (which I plan to do after my bachelor project).
The client side still represents a good amount of work but considering everything around the content of the bachelor project itself I think it is more reasonable to limit the scope of the project to the client-side development.

* Fully functional client-side application including all the client-side functionalities listed above and respecting the technical requirements.
* Report / Document explaining the technology and procedures used in the development of Open-Items.
* Weekly changelogs, progress reports documentation as well as a weekly meeting with project supervisor.
* Oral presentation to showcase the features and capabilities of Open-Items and retrospect on the project execution.

## Future ideas

What follows are some ideas of further improvements that could be added to the application after the first release:

* [2FA](https://en.wikipedia.org/wiki/Multi-factor_authentication): The application could also utilize two-factor authentication for enhanced security regarding user accounts and collections content access.
* Password protected content encryption ([E2EE](https://en.wikipedia.org/wiki/End-to-end_encryption)) to ensure the confidentiality of the collections' content.
* Configurable Rust Terminal User Interface client.
* Chromium browser extension to act as a multi-device bookmark manager.
* Use keyboard keys and shortcuts to navigate and use the whole application (with help showing controls).
* On-click redirect for links/phone numbers, ... in the application.
* Items content formatting using basic Markdown.
* Due dates and a "due today" view inside the application.
* Calendar view of an account: dates among creation, completion, edition, ...

