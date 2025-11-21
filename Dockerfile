FROM python:3.9

# Set working directory
WORKDIR /app/backend

# Copy requirements first for better caching
COPY requirements.txt /app/backend/

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire application
COPY . /app/backend/

# Expose port 8000
EXPOSE 8000

# Run database migrations and start Django server
CMD ["sh", "-c", "python3 manage.py migrate --noinput && python3 manage.py runserver 0.0.0.0:8000"]
