# Use official Tomcat 8 image
FROM tomcat:8.5-jdk8

# Remove default ROOT app
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat
COPY CraveCart.war /usr/local/tomcat/webapps/CraveCart.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
