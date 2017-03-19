
# [Components](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs) / Animated Images BETA


## Information

The AMP-HTML Animated Images Component allows to use runtime-managed animated images, typically GIF's, in AMP documents.

### Quick info

#### Latest component release: 0.4.1 (Pre-release) - 2017-03-16

[**Changelog for version 0.4.1**](https://github.com/jonhue/amphtml/blob/master/CHANGELOG.md#041-pre-release---2017-03-16)

#### Requirements

The Animated Images Component does not depend on any other components.

#### Dependents

No other components depend on the Animated Images Component.

#### [DeepIntegration](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs#deepintegration-components): Disabled


## Installation

Run in the command line:

    amphtml install anim

Now you are ready to use the Animated Images Component.

To learn more about this component, without opening the documentation, run:

    amphtml component anim


## Usage

In your views you can implement an animated image as follows:

    <%= amp_anim(source) %>
    <%= amp_anim("my-gif.gif", width: 400, height: 300, placeholder: "my-gif-screencap.jpg") %>

It also takes a block. For example, you could use the built-in `amp_placeholder` helper to achieve the same:

    <%= amp_anim("my-gif.gif", width: 400, height: 300) do %>
        <%= amp_placeholder("amp-anim", width: 400, height: 300, src: "my-gif-screencap.jpg") %>
    <% end %>

Learn more about the `amp_anim` helper in the dedicated reference linked below.


### Helpers

The following helpers are usable with the Animated Images Component of AMP-HTML

* [`amp_anim`](https://github.com/jonhue/amphtml/blob/master/lib/amphtml/helpers/docs/amp_anim.md)
