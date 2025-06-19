# Talks

This is a project to create Markdown files and transform it into slides presentation.

It utilizes the [Marp - Markdown Presentation Ecosystem](https://marp.app) lib to transform Markdown files into beautiful presentations.

Once you've edited your file, with the `assets/slides.md`, you can transform it into and html file, with this command:

```bash
cd assets

npm run build
```

It will return this information saying the slides.html has been generated into the `/priv/static/slides.html`

```
> build
> marp slides.md -o ../priv/static/slides.html

[  INFO ] Converting 1 markdown...
[  INFO ] slides.md => ../priv/static/slides.html
```

Since the output goes to `priv/static/`, your slides are automatically served by Phoenix at:
- `http://localhost:4000/slide-01.html` (when your Phoenix server is running)

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser. It will redirect to the slide.html presentation. Feel free to navigate on it.
