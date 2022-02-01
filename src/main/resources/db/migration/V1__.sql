CREATE TABLE application_user (
  id BIGINT NOT NULL,
  name VARCHAR(255) NOT NULL,
  password VARCHAR(255) NULL,
  CONSTRAINT pk_application_user PRIMARY KEY (id)
);

CREATE TABLE project (
  id BIGINT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date date NULL,
  manager_id BIGINT NOT NULL,
  CONSTRAINT pk_project PRIMARY KEY (id)
);

CREATE TABLE task (
  id BIGINT AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  start_date datetime NULL,
  end_date datetime NULL,
  assignee_id BIGINT NULL,
  project_id BIGINT NULL,
  CONSTRAINT pk_task PRIMARY KEY (id)
);

ALTER TABLE project ADD CONSTRAINT FK_PROJECT_ON_MANAGER FOREIGN KEY (manager_id) REFERENCES application_user (id);

ALTER TABLE task ADD CONSTRAINT FK_TASK_ON_ASSIGNEE FOREIGN KEY (assignee_id) REFERENCES application_user (id);

ALTER TABLE task ADD CONSTRAINT FK_TASK_ON_PROJECT FOREIGN KEY (project_id) REFERENCES project (id);