# Use the official Python 3.9 image from Docker Hub
FROM python:3.9

# Set the working directory inside the container
WORKDIR /data

# Install the required Python packages
RUN pip install --upgrade pip
RUN pip install django==3.2

# Copy the current directory contents into the container
COPY . .

# Run Django migrations
RUN python manage.py migrate

# Expose the port that the Django app will run on
EXPOSE 8000

# Command to run the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
