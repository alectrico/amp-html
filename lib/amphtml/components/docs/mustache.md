
# [Components](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs) / Mustache.js


## Information

The AMP-HTML Mustache.js Component allows rendering of templates with `{{mustaches}}`.

---

### Quick info

#### Latest component release: 0.7.4 (Pre-release) - 2017-03-22

[**Changelog for version 0.4.4**](https://github.com/jonhue/amphtml/blob/master/CHANGELOG.md#074-pre-release---2017-03-2)

#### Requirements

The Mustache.js Component does not depend on any other components.

#### Dependents

The [AMP-HTML Forms Component](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs/forms.md) depends on the Mustache.js Component.

#### [DeepIntegration](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs#deepintegration-components): Disabled

#### [Availability](https://github.com/jonhue/amphtml/tree/master/lib/amphtml/components/docs#availability-of-components): Build-in

---

## Usage

In your views you can create a Mustache.js template as follows:

    <%= amp_mustache do %>
        Hello {{world}}!
    <% end %>

Learn more about the `amp_mustache` helper in the dedicated reference linked below.


### Helpers

The following helpers are usable with the Mustache.js Component of AMP-HTML

* [`amp_mustache`](https://github.com/jonhue/amphtml/blob/master/lib/amphtml/helpers/docs/amp_mustache.md)
