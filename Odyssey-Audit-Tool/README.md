[![CircleCI](https://circleci.com/gh/ConsenSys/Odyssey-Audit-Tool/tree/master.svg?style=svg&circle-token=1275e0d80602f92706e5a346e9ec25943b25ca75)](https://circleci.com/gh/ConsenSys/Odyssey-Audit-Tool/tree/master)
[![Waffle.io - Columns and their card count](https://badge.waffle.io/ee4ba4bf175c9e56062d0d5cf555adeee4eebde7fc17bd8038ad38b86fef0a63.svg?columns=all)](https://waffle.io/ConsenSys/Odyssey-Audit-Tool)

## Overview
<img height="180px" Hspace="30" Vspace="10" align="right" src="odyssey.png"/> 

 The Odyssey Audit Tool was created in order to address the following issues

- Improve quality, consistency, readability and appeal of reports delivered to clients
- Allow update of content report during remediation cycles
- Reduce the amount of time spent for reporting 
- Align audit team around a high level methodology 
while still allowing individual working styles

## Installation 

**Install Ruby**

Odyssey Audit Tool works with recent versions of Ruby. Use [rvm](https://rvm.io/rvm/install) if you want to install another version of Ruby than the default system.

**Install Gem**

Download the latest version for the Odyssey Audit Tool from [releases](https://github.com/thec00n/Odyssey-Audit-Tool/releases) and install.

```bash
$ gem install odyssey-X.Y.Z.gem
```

`odyssey` should be on your path now.

```
$ odyssey -v
0.1.0
```

## Usage 

### Setup the project 

Run the following command and Odyssey will ask for the GitHub repos name, audit repo name and the contract directory name.

```bash
$ mkdir -p /path/to/pheonix_audit
$ cd /path/to/pheonix_audit
$ odyssey -i
```

The parameter `-i` or `--init` will require you to put a non empty prohect name which would intialises the project in the local folder. The folder has to be empty. If the Github credentials are not stored yet in `~/.odyssey/credentials.json` then the wizard will ask for them before continuing with the project setup. Create an Personal Access Token on [Github](https://github.com/settings/tokens) with full private repository permissions. Add the Github repository that will contain the issues and confirm the audit todos repository. Todos will be created next, then the severity labels as well all necessary report files will be created in the directory. 

#### Config.json

Github repository information is taken from the file `config.json`. This file is generated in the home directory of the report repo in which you run `odyssey -i`. Here is a sample of a properly formatted `config.json`:

```json
{
  "project_name": "set-protocol-contracts-audit",
  "github_repo": "ConsenSys/set-protocol-contracts",
  "github_todo_audit_repo": "https://github.com/ConsenSys/todo-audits"
}
```

the `"github_repo"` field *cannot* be a full URL with `https://`, nor can it be a partial URL ending with `.git`, or else API calls will fail and a runtime error will be signaled.


### Reporting issues

Any issue reported as part of the audit needs be created in the respective Github repository. Issues are processed if they have a severity label: `Minor`, `Medium`, `Major` and `Critical`. Issues should at least have the following elements.

```
#### Description 

#### Examples

#### Remediation 

#### References

```

#### Reference Code 

Source code can be added by inserting Github Permalinks anywhere in the issue. A [one line](https://github.com/Modular-Network/ethereum-libraries/blob/bcd15f73f0c229f7f4ac05bc872994a2cb571d65/CrowdsaleLib/IICOLib/InteractiveCrowdsaleLib.sol#L43) or [multi line](https://github.com/Modular-Network/ethereum-libraries/blob/bcd15f73f0c229f7f4ac05bc872994a2cb571d65/CrowdsaleLib/IICOLib/InteractiveCrowdsaleLib.sol#L43-L45) perma link is rendered as code snippet and link:


```Solidity
  uint256 constant NULL = 0;
```
[InteractiveCrowdsaleLib.sol:L43](https://github.com/Modular-Network/ethereum-libraries/blob/bcd15f73f0c229f7f4ac05bc872994a2cb571d65/CrowdsaleLib/IICOLib/InteractiveCrowdsaleLib.sol#L43)


```Solidity
  uint256 constant NULL = 0;
  uint256 constant HEAD = 0;
  bool constant PREV = false;
  bool constant NEXT = true;

  struct InteractiveCrowdsaleStorage {

    CrowdsaleLib.CrowdsaleStorage base; // base storage from CrowdsaleLib

```
[InteractiveCrowdsaleLib.sol:L43-L50](https://github.com/Modular-Network/ethereum-libraries/blob/bcd15f73f0c229f7f4ac05bc872994a2cb571d65/CrowdsaleLib/IICOLib/InteractiveCrowdsaleLib.sol#L43-L50)

#### Remediation Comment 

You can add a remediation comment that will be included in the overview for a closed issue. Add the "@Odyssey" annotation and the text after it will be included.

Comment on an issue:

<img width="799" align="center" alt="screen shot 2018-08-22 at 3 51 05 pm" src="https://user-images.githubusercontent.com/6027459/44450350-4666ab80-a623-11e8-98ce-9a9193b558e7.png">

Issue overview:

<img width="746" align="center" alt="screen shot 2018-08-22 at 3 51 14 pm" src="https://user-images.githubusercontent.com/6027459/44450349-45ce1500-a623-11e8-807d-714c31bb0a4f.png">


**3. Report Rendering**

There are two ways to render a report:

The parameter `-r` renders the dynamic content in the main report file `Project_Phoenix_Audit_working.md` and creates a final rendered version of the report `Project_Phoenix_Audit_final.md`. Rendering is safe and further edits can be made to `Project_Phoenix_Audit_working.md` and render can be called again.  

```
odyssey -r
```

The parameter `-e FILENAME.md` or `--export FILENAME.md` renders the dynamic content in the main report file `Project_Phoenix_Audit_standalone-working.md` and creates a final rendered version of the report `FILENAME.md`. 

More things to consider when writing the report:

* All custom edits have to be made in `Project_Phoenix_Audit_working.md`. `Project_Phoenix_Audit_final.md` will be overwritten everytime the report is rendered. 
* Update issues only in GitHub and then render the report. 
* It is safe to add new chapters after the Issue Detail chapter
* Do not remove any of the ERB template markings `<%= %>`
* Add custom pictures to the `./static-content-project-specific/` directory 
* Add tool output to the `./tool-output/` directory

### Update odyssey

```
odyssey -u
```

When ever `odyssey` is run it would check for availability of updates for both the gem and Audit-Templates. If update is availabile it would ask the user to update it using the `odyssey -u` command. If update for Audit-Templates is available it would fetch it from the github repo, if update for gem is available it would fetch the gem, build it and remove the old gem.


## Contribute

* Typos or minor changes to templates can be just pushed directly to the repo 
* Major changes to structure of the templates or code should be a PR
* For updating or adding Audit Todos check the issues of https://github.com/ConsenSys/todo-audits
* Run tests `rspec`
