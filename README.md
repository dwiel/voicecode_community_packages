# voicecode_community_packages
This is a place where voicecode users can all contribute custom packages in a central location

## The Goal

Everyone is invited to modify and provide additional packages they think others might find useful.

## Contributing

We're still deciding on the best style guidelines to enable low friction usage of this repository.

In general, we can use the following minimal guidelines:

- Each package should have its own file with a reasonable name: `outlook.coffee`
- If there is already a package which serves a similar purpose than the 1 you're contributing, but is not compatible, create a new package with a unique name: `vimium-username.coffee`. It is likely that multiple people will have packages for the same application but with different styles.
- Include a footer: `# Custom User Commands Below This Line` so that merging changes to the main package upstream does not result in merge conflicts with custom user commands.
