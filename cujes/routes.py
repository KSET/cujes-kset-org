from cujes import cujes_app as app
from flask import render_template


posts = {
    1: {
        'title': "Mace",
        'author': "rincewind",
        'date': '26.07.2019.',
        'body': "Mace su najbolje 123"
    },
    2: {
        'title': "Peseki",
        'author': "rincewind",
        'date': '26.07.2019.',
        'body': "Peseki su oke"
    },
    3: {
        'title': "Pimpeki",
        'author': "rincewind",
        'date': '26.07.2019.',
        'body': "Pimpeki su zakon"
    }
}


bands = {
    1: {
        'name': "K3P",
        'town': "Zagreb",
        'genre': "ska punk1",
        'bio': "k3p bio"
    },
    2: {
        'name': "K4P",
        'town': "Zagreb2",
        'genre': "punk ska2",
        'bio': "k3p bio2"
    },
    3: {
        'name': "K5P",
        'town': "Zagreb3",
        'genre': "ska-punk3",
        'bio': "k3p bio3"
    }
}


@app.route('/')
@app.route('/index')
def index():
    title = "Čuješ?!"
    return render_template("index.html",
                           title=title,
                           bands=bands
                           )


@app.route('/vijesti')
def news():
    title = "Vijesti"
    return render_template("news.html",
                           title=title,
                           bands=bands,
                           posts=posts,
                           )


@app.route('/vijesti/<post_id>')
def news_post(post_id):
    post = posts[int(post_id)]
    return render_template("news_post.html",
                           bands=bands,
                           post=post)


@app.route('/izvodaci/<band_id>')
def band_post(band_id):
    band = bands[int(band_id)]
    return render_template("band_page.html",
                           bands=bands,
                           band=band)
