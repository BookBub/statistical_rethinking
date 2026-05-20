{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.python311
    pkgs.git
  ];

  shellHook = ''
    # Create and activate virtual environment if it doesn't exist
    if [ ! -d .venv ]; then
      echo "Creating virtual environment..."
      python3.11 -m venv .venv
      source .venv/bin/activate

      # Upgrade pip first
      pip install --upgrade pip

      # Install Python dependencies
      echo "Installing Python packages (arviz, matplotlib, jax, numpyro, jupyter)..."
      pip install arviz matplotlib jax numpyro jupyter
    else
      source .venv/bin/activate
    fi

    echo "=========================================="
    echo "Statistical Rethinking environment ready!"
    echo "Run 'jupyter notebook' to start."
    echo "=========================================="
  '';
}
