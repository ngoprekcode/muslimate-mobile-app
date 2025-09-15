# Mulimate Mobile Apps Flutter

This repository is bootstrapped using melos. In short, this repositories contains apps that shared the same codebase and reusable components in Flutter. The idea can be generalized for various use cases.

## Getting Started

- Install Flutter, you can follow instruction from [here](https://docs.flutter.dev/get-started/install)

- Clone the repository using HTTP / SSH. If you haven't done github ssh setup, follow the instructions for SSH [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

```bash
> git@github.com:ngoprekcode/muslimate-mobile-app.git
```


## Setup Melos

If you are not having `melos` setup, heading to: [here](https://pub.dev/packages/melos) for the config,
then you can start bootstrap with:

```bash
> melos bs
```

or

```bash
> melos bootstrap
```

## Melos Scripting (Installed)

Generate the `translations`:

```bash
> melos locale
```
Generate the `assets (fonts, images, icons, etc)`:

```bash
> melos assets
```
The applications (`muslimate`) shared the same SharedWidget from `shared` modules

## About

<img src="resources/img_muslimate_logo.png" width='100'>

This project is maintained and funded by Muslimate Team.