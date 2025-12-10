# Start from uv image
FROM python:3.12-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Change the working directory to the `app` directory
WORKDIR /app

# Install git using the system package manager
RUN apt-get update && apt-get install -y git

# Copy ONLY the dependency file first to leverage Docker layer caching
COPY pyproject.toml .

# Install all dependencies using uv
RUN uv pip install --system .[dev]

# Copy the rest of your project code into the image
COPY . .

# Default command
CMD [ "bash" ]