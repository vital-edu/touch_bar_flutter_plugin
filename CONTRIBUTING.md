# Contributing to TouchBar Flutter Plugin

## 1. Things you will need

- Linux, Mac OS X, or Windows.
- [git](https://git-scm.com) (used for source version control).
- An ssh client (used to authenticate with GitHub).
- An IDE such as [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/).

## 2. Forking & cloning the repository

- Ensure all the dependencies described in the previous section are installed.
- Fork `https://github.com/vital-edu/touch_bar_flutter_plugin.git` into your own GitHub account. If
  you already have a fork, and are now installing a development environment on
  a new machine, make sure you've updated your fork so that you don't use stale
  configuration options from long ago.
- If you haven't configured your machine with an SSH key that's known to github, then
  follow [GitHub's directions](https://help.github.com/articles/generating-ssh-keys/)
  to generate an SSH key.
- `git clone git@github.com:<your_name_here>/touch_bar_flutter_plugin.git`
- `git remote add upstream git@github.com:vital-edu/touch_bar_flutter_plugin.git` (So that you
  fetch from the master repository, not your clone, when running `git fetch`
  et al.)

## 3. Environment Setup

We use [Melos](https://melos.invertase.dev/) to manage the project and dependencies.

To install Melos, run the following command from your SSH client:

```bash
dart pub global activate melos
```

Next, at the root of your locally cloned repository bootstrap the projects dependencies:

```bash
melos bootstrap
```

The bootstrap command locally links all dependencies within the project without having to
provide manual [`dependency_overrides`](https://dart.dev/tools/pub/pubspec). This allows all
packages and example to build from the local clone project.

> You do not need to run `flutter pub get` once bootstrap has been completed.

> If you're using [fvm](https://fvm.app/) you might need to specify the sdk-path: `melos bs --sdk-path=/Users/user/fvm/default/`

## 4. Running the example

We have an example app which aims to showcase the plugin features on MacOS.

To run an example, run the `flutter run` command from the `example` directory:

```bash
cd example
flutter run
```

Using Melos (installed in step 3), any changes made to the packages will also be reflected in all other packages that
depends on it automatically.

## 5. Contributing code

We gladly accept contributions via GitHub pull requests.

To start working on a patch:

1. `git fetch upstream`
2. `git checkout upstream/master -b <name_of_your_branch>`
3. Hack away!

Once you have made your changes, commit and push your code:

1. `git commit -a -m "<your informative commit message>"`
2. `git push origin <name_of_your_branch>`

To send us a pull request:

- `git pull-request` (if you are using [Hub](http://github.com/github/hub/)) or
  go to `https://github.com/vital-edu/touch_bar_flutter_plugin` and click the
  "Compare & pull request" button

Please make sure all your check-ins have detailed commit messages explaining the patch.

When naming the title of your pull request, please follow the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/)
guide. For example, for a fix to the TouchBarPlatformInterface package:

`fix(interface): fixed a bug!`

Please use one of the scopes below:

- no scope: when the changes are global or related with multiple packages (e.g.: `fix: fixed a bug!`)
- interface: when the changes are related with the `touch_bar_platform_interface` package (e.g.: `fix(interface): fixed a bug!`)
- macos: when the changes are related with the `touch_bar_macos` package (e.g.: `fix(macos): fixed a bug!`)
- touch_bar: when the changes are related with the `touch_bar` package (e.g.: `fix(touch_bar): fixed a bug!`)

Once you create your PR wait for one the package maintainers to review and merge the pull request.

If you've never submitted code before, you must add your (or your
organization's) name and contact info to the [AUTHORS](AUTHORS) file.

If you create a new file, do not forget to add the license header.

### The release process

We push releases manually.
