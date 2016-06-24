# git utils

Some simple utilities for git-based build/deploy scripts.

## Usage

Edit [git_utils.cfg](git_utils.cfg) to conform with your own repo, then start using the scripts to help automate your release process.
See below for an example.

## Example

See the example files [bump_version.sh](bump_version.sh) and [cut_release.sh](cut_release.sh)
for some guidance on how to use these utils.

In short, the scripts load methods from `git_utils` and then execute a few commands to accomplish their task.
`bump_version` sets some arbitrary number saved in a file called `example.cfg`, then commits the change locally.
`cut_release` also bumps the version, and additionally pushes a new tag and a new branch called `release`.

You can customize these scripts to work with any process you have on your team; they're intended to be very flexible
without forcing you to conform to any particular release process.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
