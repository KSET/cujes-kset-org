from cujes import cujes_app as app


@app.route('/')
@app.route('/index')
def index():
    return "Hello, World!"
